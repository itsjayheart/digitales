class WhatIfsController < ApplicationController
	def create
		@digitale = Digitale.find(params['digitale_id'])
		@what_if = WhatIf.create(creatrix: current_creatrix, sentence: params['content'], description: params['description'])
    @node = Node.create(nodeable: @what_if, creatrix: current_creatrix, digitale: @digitale, title: @what_if.sentence, content: @what_if.description)

    @form_dom_id = "digitaleMStatementForm1"

    if @node.save
      respond_to do |format|
        format.js { }
      end
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
