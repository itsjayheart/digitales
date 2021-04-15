class GgWhatIfsController < ApplicationController
	def create
		hash = params['gg_what_if']
		@digitale = Digitale.find(hash['digitale_id'])

		@gg_what_if = GgWhatIf.create(digitale: @digitale, title: hash['title'])
		@gg_m_statement = GgMStatement.new

		respond_to do |format|
			format.js {}
		end
	end
end
