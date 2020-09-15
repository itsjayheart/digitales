class WhatIfsController < ApplicationController
	def create
		@digitale = Digitale.find(params['digitale_id'])
		@what_if = WhatIf.create(creatrix: current_creatrix, sentence: params['content'], description: params['description'])
        @node = Node.create(nodeable: @what_if, creatrix: current_creatrix, digitale: Digitale.find(params['digitale_id']), title: @what_if.sentence, content: @what_if.description)

        if @node.save
          respond_to do |format|
            format.js { }
          end
        else
          render :new
        end
	end

	def update
	  @tale = Tale.update(title: params['content'], description: params['description'])
      @node = Node.update(title: params['content'], content: params['description'])

      respond_to do |format|
        format.js{ }
      end
	end
end
