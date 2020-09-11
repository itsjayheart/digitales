class FundraiserController < ApplicationController
  def create
  end

  def new
    @node = Node.find(params(:node_id))

    @fundraiser = Fundraiser.new
  end
end
