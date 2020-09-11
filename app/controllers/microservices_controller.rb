class MicroservicesController < ApplicationController

  def create
    price = params["microservice"]['price'].to_f * 100
  	@microservice = Microservice.new(creatrix: current_creatrix, microservice_category: MicroserviceCategory.find(params['microservice_category_id']), price: price)
    
    @microservice.picture.attach(params[:picture])

    @microservice_category = @microservice.microservice_category

    @microservice.save ? @errors = nil : @errors = @microservice.errors.full_messages.to_sentence
    
    respond_to do |format|
      format.html { redirect_to creatrix_path(current_creatrix.id) }
      format.js { }
    end
  end

  def index
    @node = Node.find(params[:node_id])
    
    current_microservice_category = @node.current_microservice.microservice_category


    @microservices = []
    Microservice.all.each do |microservice|
      @microservices << microservice if microservice == current_microservice_category
    end

    


    
  end

end
