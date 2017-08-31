class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception 
  
  
 before_action :configure_permitted_parameters, if: :devise_controller?    
                                                          
  protected
                                         
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :country])    # devise 기본 컬럼에서 추가 컬럼을 추가하는 코드  username 추가 avatar추가 
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avarter, :country])
    end
    
  
end
