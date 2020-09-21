class LandingPageController < ApplicationController
  layout "landing_page", only: [:index]

  def index
  end
end