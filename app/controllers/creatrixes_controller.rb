class CreatrixesController < ApplicationController

  def show
  	if params['id'] == nil
  		@creatrix = current_creatrix
  	else
  		@creatrix = Creatrix.find(params['id'])
  	end
	@achievements = AchievementCategory.all
  	@microservice = Microservice.new
  end

end
