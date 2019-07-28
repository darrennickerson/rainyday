class ApplicationController < ActionController::Base


    def is_admin?
        if user_signed_in? && current_user.try(:admin?)
            true
        else
            redirect_to root_path
    
        end
    end
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :first_name, :last_name, :admin)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :first_name, :last_name, :admin)}
         end
end
