class DonatedSumsController < ApplicationController
  def new
    @sum = (params[:donated_sum][:sum].to_f * 100).to_i
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js { }
    end
  end

  def create
  # Amount in cents
  @amount = @params[:sum]
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
  rescue Stripe::CardError => e
  flash[:error] = e.message
  #redirect_to


  end
end
