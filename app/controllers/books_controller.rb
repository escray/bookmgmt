class BooksController < ApplicationController
  before_action :set_book, only: %i[show add_to_cart]
  skip_after_action :verify_authorized, :verify_policy_scoped
  def index
    @books = Book.all
  end

  def show; end

  def add_to_cart
    # redirect_to :back
    if !current_cart.books.include?(@book)
      current_cart.add_book_to_cart(@book)
      flash[:notice] = "你已成功将 #{@book.title} 加入借书单"
    else
      flash[:warning] = '借书单中已有'
    end
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的图书不存在'
    redirect_to books_path
  end
end
