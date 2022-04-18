class Public::BooksController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @ranks = Book.find(Favorite.group(:book_id).order('count(book_id) DESC').limit(4).pluck(:book_id))
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render "new"
    end
  end

  def destroy
  end

  def search
    @results = @q.result.includes(:user)
  end


  private

  def book_params
    params.require(:book).permit(:name,:image,:introduction)
  end

  def set_q
    @q = Book.ransack(params[:q])
  end
end
