class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  before_action :check_guest, only: :edit

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
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

  def check_guest
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to root_path
      flash[:alert] = 'ゲストは編集できません'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:family_name,:first_name,:family_name_kana,:first_name_kana,:user_image,:introduction,:is_deleted,:favorite_id)
  end
end
