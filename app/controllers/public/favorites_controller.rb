class Public::FavoritesController < ApplicationController

  def index
    @books = current_user.favorite_books
  end

  def create
    if current_user.name != "guestuser"
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.new(book_id: @book.id)
      @favorite.save
    end
  end

  def destroy
    if current_user.name != "guestuser"
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.find_by(book_id: @book.id)
      @favorite.destroy
    end
  end
end
