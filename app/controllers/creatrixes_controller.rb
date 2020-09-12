class CreatrixesController < ApplicationController

  def show
  	if params['id'] == nil
  		@creatrix = current_creatrix
  	else
  		@creatrix = Creatrix.find(params['id'])
	end
	
	@microservices = Microservice.where(creatrix: current_creatrix)

	@microservice_requests =[]
	@microservices.each do |microservice| 
		MicroserviceRequest.where(microservice: microservice, accepted?: false).each { |microservice_request| @microservice_requests << microservice_request }
	end

	puts "%" * 100
	puts @microservice_requests
	puts "%" * 100


	@achievements = AchievementCategory.all
  	@microservice = Microservice.new
  end

end
