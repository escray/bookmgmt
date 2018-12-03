# book
class Admin::BooksController < ApplicationController
  layout 'admin'
  before_action :set_book, only: %i[show edit update destroy]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = '图书保存成功'
      redirect_to admin_books_path
    else
      flash[:alert] = '图书创建未成功'
      render :new
    end
  end

  def index
    @books = Book.all
  end

  # def show; end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:notice] = '图书更新成功'
      redirect_to admin_books_path
    else
      flash[:alert] = '图书更新未成功'
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = '图书删除成功'
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book)
          .permit(:title, :subheading, :author, :series_name, :language,
                  :original_name, :publisher, :translator, :editor, :pub_date,
                  :pub_year, :edit_num, :page, :remark, :isbn, :copy, :keyword,
                  :price, :barcode, :image, :rate, :rate_num, :format,
                  :description, :book_class, :shelf_class, :shelf_num,
                  :record_date)
  end

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '您所查看的图书不存在'
    redirect_to admin_books_path
  end
end
