class MicroservicesController < ApplicationController

  def new
  	unless params['creatrix_id'] == nil
  		@creatrix = Creatrix.find(params['creatrix_id'])
  	end
  		@microservice = Microservice.new
  end

  def create
  	microservice = Microservice.new(creatrix: current_creatrix, microservice_category: params['microservice_category'], price: params['price'])

  	if microservice.save
  		redirect_to creatrix_path(current_creatrix.id)
  	else
  		render :new
  	end
  end

end
