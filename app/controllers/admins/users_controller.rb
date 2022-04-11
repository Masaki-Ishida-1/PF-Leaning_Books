class Admins::UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def user_params
    params.require(:user).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:email,:is_deleted)
  end
end
