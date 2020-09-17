class AvatarsController < ApplicationController
    def create
        @creatrix = Creatrix.find(params[:creatrix_id])
        @creatrix.avatar.attach(params[:avatar])
        redirect_to(creatrix_path(@creatrix))
    end

end
