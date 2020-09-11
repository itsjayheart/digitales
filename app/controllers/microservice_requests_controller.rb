class MicroserviceRequestsController < ApplicationController
  def create
    @microservice = Microservice.find(params[:microservice_id])
    @node = Node.find(params[:node_id])
    MicroserviceRequest.create(microservice: @microservice, achievement: @node.non_achieved)
    redirect_to node_path(@node.id)
  end

  def update
    @microservice_request = MicroserviceRequest.find(params[:id])

    @microservice_request.update(accepted?: true)

    @creatrix = @microservice_request.achievement.node.creatrix

    @fundraiser = Fundraiser.create(microservice_request: @microservice_request, creatrix: @creatrix, goal: @microservice_request.microservice.price)

    redirect_to creatrix_path(@creatrix.id)
  end
end
