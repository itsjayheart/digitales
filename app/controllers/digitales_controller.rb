class DigitalesController < ApplicationController
  def show
  	@digitale = Digitale.find(params['id'])
    @achievement_categories = AchievementCategory.all
  	@digitale.m_statements.sort { |a, b|  a.id <=> b.id }.each do |m_statement|
      if m_statement.non_achieved
        if m_statement.in_production? == false
          m_statement.update(in_production?: true)
            @current_node = m_statement
            break
        else 
          @current_node = m_statement
          break
        end
      end
    end
    
  	@donated_sum = DonatedSum.new

    if Fundraiser.find_by(microservice_request: @current_node.non_achieved.microservice_requests.last)
      @fundraiser = Fundraiser.find_by(microservice_request: @current_node.non_achieved.microservice_requests.last)
      @per_cent_status = (@fundraiser.current_fundings.ceil * 100) / @fundraiser.goal.ceil
    end
  end
end