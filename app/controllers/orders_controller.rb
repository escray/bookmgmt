class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render 'carts/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:borrow_at, :due_at)
  end
end
