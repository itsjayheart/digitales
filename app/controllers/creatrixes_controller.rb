class CreatrixesController < ApplicationController
	before_action :authenticate_creatrix, only: [:show]

  def show

	@donated_sums = DonatedSum.where(creatrix: current_creatrix)
	@digitales = Digitale.where(creatrix: current_creatrix)

  	if params['id'] == nil
  		@creatrix = current_creatrix
  	else
  		@creatrix = Creatrix.find(params['id'])
	end
	
	@microservices = Microservice.where(creatrix: current_creatrix)

	@microservice_requests =[]
	@microservices.each do |microservice| 
		MicroserviceRequest.where(microservice: microservice).each {|microservice_request| @microservice_requests << microservice_request}
	end

	@achievements = AchievementCategory.all
  	@microservice = Microservice.new
  end

end