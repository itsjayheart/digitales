class MicroserviceRequestsController < ApplicationController
  def create
    @microservice = Microservice.find(params[:microservice_id])
    @node = Node.find(params[:node_id])
    MicroserviceRequest.create(microservice: @microservice, achievement: @node.non_achieved)
    redirect_to node_path(@node.id)
  end

  def update
    @microservice_request = MicroserviceRequest.find(params[:id])
    action =  params[:microservice_request][:action] if params[:microservice_request][:action]

    if  params[:microservice_request][:accepted]
      @microservice_request.update(accepted?: true)
      @creatrix = @microservice_request.achievement.node.creatrix
      @fundraiser = Fundraiser.create(microservice_request: @microservice_request, creatrix: @creatrix, goal: @microservice_request.microservice.price)
      redirect_to creatrix_path(@creatrix.id)
    end

    if params[:microservice_request][:art_work]
      @microservice_request.art_work.attach(params[:art_work])
      node = MicroserviceRequest.last.achievement.node
      redirect_to node_path(node.id)
    end

  end
end
