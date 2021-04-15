class GgMStatementsController < ApplicationController
	def create
		hash = params['gg_m_statement']
		@digitale = Digitale.find(hash['digitale_id'])

		@gg_m_statement = GgMStatement.create(digitale: @digitale, title: hash['title'], order: hash['order'])
		@gg_m_statement = GgMStatement.new

		@chapters = [0, 'I', 'II', 'III', 'IIII', 'V', 'VI', 'VII']

		@order = @digitale.gg_m_statements.all.count + 1
		@previous_order = @order - 1
		@chapter = @chapters[@order]


		respond_to do |format|
			format.js {}
		end
	end
end
