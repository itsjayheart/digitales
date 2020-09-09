class NodesController < ApplicationController
    def index
      @nodes = Node.all
      @cards_classes = ["card text-white bg-dark mb-3", "card bg-light mb-3", "card-columns"]
    end

    def show
      @nodes = Node.all
      @node = Node.find(params[:id])
      @cards_classes = ["text-white bg-dark", "text-dark bg-light", "card-columns"]
    end
  end