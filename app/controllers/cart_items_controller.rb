class CartItemsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, :verify_policy_scoped

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(book_id: params[:id])
    @book = @cart_item.book
    @cart_item.destroy

    flash[:warning] = "成功将 #{@book.title} 从借书单删除"
    redirect_to carts_path
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(book_id: params[:id])

    if @cart_item.book.copy >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = '成功变更数量'
    else
      flash[:warning] = '数量不足'
    end

    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
