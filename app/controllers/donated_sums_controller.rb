class DonatedSumsController < ApplicationController
  def new
    @sum = params[:donated_sum][:sum]
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

    redirect_to digitale_path(@node.digitale.id)

    fundraiser =  @node.non_achieved.microservices.last.microservice_requests.last.fundraisers.last
    puts @amount.to_i/100.0
    donated_sum = DonatedSum.create(creatrix: current_creatrix, sum: @amount.to_i/100.0, fundraiser: fundraiser)
    puts donated_sum.errors.full_messages.to_sentence

    if fundraiser.current_fundings >= fundraiser.goal
      fundraiser.update(funded?: true)
      fundraiser.microservice_request.achievement.update(achieved?:true) if fundraiser.microservice_request.microservice_category.id == fundraiser.microservice_request.achievement.achievement_category.microservice_categories.last.id
    end

    rescue Stripe::CardError => e
    flash[:error] = e.message
  end

  def update
    @sum = params[:donated_sum][:sum]
    @node = Node.find(params[:node_id])
    fundraiser =  @node.non_achieved.microservices.last.microservice_requests.last.fundraisers.last

    donated_sum = DonatedSum.create(creatrix: current_creatrix, sum: @sum, fundraiser: fundraiser)
    @errors = donated_sum.errors.full_messages.to_sentence
    donated_sum.delete

    respond_to do |format|
      format.html { redirect_to node_path(@node.id) }
      format.js { }
    end
  end
end
