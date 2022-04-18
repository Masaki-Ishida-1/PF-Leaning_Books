class Public::UsersController < ApplicationController
  def show
    @books = current_user.books
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def withdraw
    user = User.find(params[:id])
    user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:family_name,:first_name,:family_name_kana,:first_name_kana,:image,:introduction,:is_deleted,:favorite_id)
  end
end
