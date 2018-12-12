class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.aasm_state = 'borrow_required'
    # @order.total = cart_items.total
    if @order.save
      current_cart.cart_items.each do |cart_item|
        borrow_list = BorrowList.new
        borrow_list.order = @order
        borrow_list.book = cart_item.book
        borrow_list.quantity = cart_item.quantity
        borrow_list.save
      end
      current_cart.clean!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @borrow_lists = @order.borrow_lists
  end

  private

  def order_params
    params.require(:order).permit(:borrower, :borrow_at, :due_at)
  end
end
