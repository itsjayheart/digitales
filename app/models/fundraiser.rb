class Fundraiser < ApplicationRecord

    belongs_to :creatrix
    belongs_to :microservice_achievement_relation
    
    has_many :donated_sums

    def current_fundings
    	current_fundings = []
    	self.donated_sums.each do |sum|
    		sum = sum.sum 
    		current_fundings << sum
    	end
    	return current_fundings.sum
    end

    def to_be_funded
    	return self.goal - self.current_fundings
    end
end
