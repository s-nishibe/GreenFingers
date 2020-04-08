class ApplicationController < ActionController::Base

  add_flash_types :succcess, :danger, :info

  private

  # login, logout後の遷移先
  def after_sign_in_path_for(resource)
  	case resource
  	  when AdminUser
  	  	admin_root_path
  	  when User
  	  	user_path(resource)
  	end
  end

  def after_sign_out_path_for(resource)
    if AdminUser
      new_admin_user_session_path
    end
  end
end