class MStatementsController < ApplicationController
	def create
		puts params['digitale_id']

		@digitale = Digitale.find(params['digitale_id'])

		puts @digitale 
		puts @digitale.id

		@m_statement = MStatement.create(creatrix: current_creatrix, sentence: params['content'], description: params['description'])

		@node = Node.new(nodeable: @m_statement, creatrix: current_creatrix, digitale: @digitale, title: params['content'], content: params['description'])
		    
		i = @digitale.m_statements.count
		
		@ex_form_dom_id = "digitaleMStatementForm" + (i + 1).to_s

		@form_dom_id = "digitaleMStatementForm" + (i + 2).to_s

		@edit_form_dom_id = "editDigitaleMStatementForm" + (i + 1).to_s

		puts @digitale.m_statements.length


		if @node.save
			respond_to do |format|
				format.js { }
			end
		end

		puts @digitale.m_statements.length


	end

	def update
	  @tale = Tale.update(title: params['content'], description: params['description'])
      @node = Node.update(title: params['content'], content: params['description'])

      respond_to do |format|
        format.js{ }
      end
	end
end
