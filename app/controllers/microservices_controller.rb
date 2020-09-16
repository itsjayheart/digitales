class MicroservicesController < ApplicationController

  def create
    price = params["microservice"]['price']
  	@microservice = Microservice.new(creatrix: current_creatrix, microservice_category: MicroserviceCategory.find(params['microservice_category_id']), price: price)
    
    puts "$"*100
    puts params[:microservice][:soundcloude]
    puts "$"*100

    @microservice.update(youtube: "<iframe width='100%' height='100%' src='#{params[:microservice][:youtube].sub("https://www.youtube.com/watch?v=","http://www.youtube.com/embed/")}' frameborder='0'></iframe>") if params[:microservice][:youtube]
    @microservice.update(soundcloude: params[:microservice][:soundcloude]) if params[:microservice][:soundcloude]
    @microservice.update(quill: params[:microservice][:quill]) if params[:microservice][:quill]
    @microservice.picture.attach(params[:picture]) if params[:picture]

    @microservice_category = @microservice.microservice_category

    @microservice.save ? @errors = nil : @errors = @microservice.errors.full_messages.to_sentence
    
    respond_to do |format|
      format.html { redirect_to creatrix_path(current_creatrix.id) }
      format.js { }
    end
  end

  def index
    @node = Node.find(params[:node_id])
    
    @current_microservice_category = @node.current_microservice_category

    puts @current_microservice_category.name

    @microservices = []
    Microservice.all.each do |microservice|
      @microservices << microservice if microservice.microservice_category.name == @current_microservice_category.name
    end
  end

  def destroy
    @microservice = Microservice.find(params[:id])
    @microservice.delete if @microservice
    respond_to do |format|
      format.html { redirect_to creatrix_path(current_creatrix.id) }
      format.js { }
    end
  end
end
