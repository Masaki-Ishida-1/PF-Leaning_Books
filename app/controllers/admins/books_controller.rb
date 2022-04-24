class Admins::BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(10)
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy(book_params)
      redirect_to book_path(@book)
    else
      render "index"
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,:book_image,:introduction,:favorite_id,:user_id,:star)
  end
end
