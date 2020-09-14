class DonatedSumsController < ApplicationController
  def new
    @sum = (params[:donated_sum][:sum].to_f * 100).to_i
    @node = Node.find(params[:node_id])
  end

  def create
  @node = Node.find(params[:node_id])
  @amount =  params[:donated_sum][:sum]
  # Amount in cents
  customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
  })
  charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
  })
  redirect_to node_path(@node.id)

  achievement = @node.achievements.last

  microservice_request = MicroserviceRequest.find_by(achievement: achievement)

  fundraiser = Fundraiser.find_by(microservice_request: microservice_request)

  DonatedSum.create(creatrix: current_creatrix, sum: @amount, fundraiser: fundraiser)

  if fundraiser.current_fundings >= fundraiser.goal
    fundraiser.update(funded?: true)
  end

  rescue Stripe::CardError => e
  flash[:error] = e.message
  end
end
