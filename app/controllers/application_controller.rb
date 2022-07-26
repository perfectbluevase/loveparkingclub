class ApplicationController < ActionController::Base
  
def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_top_path
  when User
    public_user_path(current_user.id)
    #public_user_path(current_user.id)
  end
end

before_action :configure_permitted_parameters, if: :devise_controller?

 protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
end
  
end
