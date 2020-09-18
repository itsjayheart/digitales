class MicroserviceRequestsController < ApplicationController
  def create
    @microservice = Microservice.find(params[:microservice_id])
    @node = Node.find(params[:node_id])
    MicroserviceRequest.create(microservice: @microservice, achievement: @node.non_achieved, microservice_category: @microservice.microservice_category)
    redirect_to digitale_path(@node.digitale.id)
  end

  def update
    @microservice_request = MicroserviceRequest.find(params[:id])
    action =  params[:microservice_request][:action] if params[:microservice_request][:action]
    @y = 0
    if  params[:microservice_request][:accepted]
      @microservice_request.update(accepted?: true)
      @creatrix = @microservice_request.achievement.node.creatrix
      @fundraiser = Fundraiser.create(microservice_request: @microservice_request, creatrix: @creatrix, goal: @microservice_request.microservice.price)
    end

    if params[:microservice_request][:media]
      @microservice.update(youtube:params[:microservice][:youtube]) if params[:microservice][:youtube]
      @microservice_request.update(soundcloude: params[:microservice_request][:soundcloude]) if params[:microservice_request][:soundcloude]
      @microservice_request.update(quill: params[:microservice_request][:quill]) if params[:microservice_request][:quill]
      @microservice_request.art_work.attach(params[:art_work]) if params[:art_work]      

      @microservice_request.update(delivered?: true)
      node = @microservice_request.achievement.node
    end
    puts 0*10000
    respond_to do |format|
      format.html { redirect_to creatrix_path(current_creatrix.id) }
      format.js { }
    end
  end
end
