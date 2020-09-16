class ApplicationController < ActionController::Base
   
    def authenticate_creatrix
        unless current_creatrix
          flash[:danger] = "Please log in."
          redirect_to unauthenticated_root_path
        end
    end

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
      end

end
