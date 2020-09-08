class DigitalesDotGgController < ApplicationController
  def static_index
    @nodes = Node.all
    @cards_classes = ["card text-white bg-dark mb-3", "card bg-light mb-3"]

  end
end
