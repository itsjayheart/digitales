class DigitalesDotGgController < ApplicationController

  def homepage
  end

  def the_diver
  end

  def the_pool
  	@gg_pool = []
  	if Digitale.all.count >= 21
      @gg_pool << Digitale.all.sample
	  	while @gg_pool.count != 21 do
	  		digitale = Digitale.all.sample
	  		unless @gg_pool.any?(id: digitale.id)
	  			@gg_pool << digitale
	  		end
	  	end	
  	end
  end

end