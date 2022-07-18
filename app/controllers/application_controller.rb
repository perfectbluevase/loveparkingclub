class ApplicationController < ActionController::Base
  
def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_top_path
  when User
    public_user_path(current_user.id)
  end
end
  
  
end
