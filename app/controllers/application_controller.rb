class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :succcess, :danger, :info

  private

  # login, logout後の遷移先
  def after_sign_in_path_for(resource)
  	case resource
  	  when AdminUser
  	  	admin_root_path
  	  when User
  	  	blogs_path(user_path: resource, page: 'TL')
  	end
  end

  def after_sign_out_path_for(resource)
    homes_top_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
end