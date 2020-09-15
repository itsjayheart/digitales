class MStatementsController < ApplicationController
	def create
		@digitale = Digitale.find(params['digitale_id'])
		@m_statement = MStatement.create(creatrix: current_creatrix, sentence: params['content'], description: params['description'])

		@node = Node.new(nodeable: @m_statement, creatrix: current_creatrix, digitale: @digitale, title: params['content'], content: params['description'])
		    
		i = @digitale.m_statements.count
		
		@ex_form_dom_id = "digitaleMStatementForm" + i.to_s
		@form_dom_id = "digitaleMStatementForm" + (i + 1).to_s


		if @node.save
			if @digitale.m_statements
				if @digitale.m_statements.length == 7
					redirect_to digitale_path(@digitale.id)
				else
					respond_to do |format|
						format.js { }
					end
				end
			else
				respond_to do |format|
					format.js { }
				end
			end
		end

	end

	def update

	end
end
