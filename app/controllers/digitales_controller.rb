class DigitalesController < ApplicationController
  def show
  	@digitale = Digitale.find(params['id'])
  end
end
