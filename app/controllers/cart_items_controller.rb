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
end
