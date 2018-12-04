class BooksController < ApplicationController
  before_action :set_book, only: %i[show add_to_cart]
  skip_after_action :verify_authorized, :verify_policy_scoped
  def index
    @books = Book.all
  end

  def show; end

  def add_to_cart
    # redirect_to :back
    current_cart.add_book_to_cart(@book)
    redirect_to books_path
    flash[:notice] = '加入借书单'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的图书不存在'
    redirect_to books_path
  end
end
