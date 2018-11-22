class BooksController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end
