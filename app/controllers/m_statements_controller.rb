class MStatementsController < ApplicationController
	def create
		@digitale = Digitale.find(params['digitale_id'])
		@m_statement = MStatement.create(creatrix: current_creatrix, sentence: params['content'], description: params['description'])
		@node = Node.new(nodeable: @m_statement, creatrix: current_creatrix, digitale: @digitale, sentence: params['content'], description: params['description'])
		
		if @node.save
			if @digitale.m_statements
				if @digitale.m_statements.length < 7
					respond_to do |format|
						format.js { }
					end
				end
			else
				redirect_to 

	end

	def update

	end
end
