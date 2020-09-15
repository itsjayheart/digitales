class DigitalesDotGgController < ApplicationController
  def the_pool
    @digitales = []
    21.times do |i|
      @digitales << 't a l e s | o f | b l a h | b l a h' + i.to_s
    end
  end

  def the_hook
  end

  def the_diver
  end
end