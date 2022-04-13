class Public::UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def withdraw
    customer = Customer.find(params[:id])
    customer.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:family_name,:first_name,:family_name_kana,:first_name_kana,:image,:introduction,:is_deleted,:favorite_id)
  end
end
