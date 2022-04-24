class Public::BooksController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user!
  before_action :check_guest, only: [:destroy]

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @ranks = Book.includes(:favorited_users).limit(5).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
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
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render "edit"
    end
  end

  def search
    @results = @q.result.includes(:user)
  end

  def check_guest
    @book = Book.find(params[:id])
    if @book.user.email == 'guest@example.com'
      redirect_to root_path
      flash[:alert] = 'ゲストは操作できません'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,:book_image,:introduction,:favorite_id,:user_id,:star)
  end

  def set_q
    @q = Book.ransack(params[:q])
  end

end
