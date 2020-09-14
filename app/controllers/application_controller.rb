class ApplicationController < ActionController::Base
   
    def authenticate_creatrix
        unless current_creatrix
          flash[:danger] = "Please log in."
          redirect_to unauthenticated_root_path
        end
    end


end
