class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   if current_admin
      admins_users_path
   elsif current_user
        books_path
   end
  end

  def after_sign_out_path_for(resource)
        root_path
  end

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :is_deleted])
  devise_parameter_sanitizer.permit(:account_update,keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :is_deleted])
 end

end
