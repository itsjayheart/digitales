class Node < ApplicationRecord
	
    belongs_to :nodeable, polymorphic: true
    belongs_to :creatrix

    has_many :achievements

    def non_achieved
    	return self.achievements.select { |ach| ach.achieved? == false }[0]
    end
    
    def current_fundraiser
    	return Fundraiser.where(funded?: false, microservice_achievement_relation: MicroserviceAchievementRelation.where(achievement: self.non_achieved)).sample
    end

    def current_microservice
    	i = self.non_achieved.microservices.count - 1
		return Microservice.where(microservice_category: self.non_achieved.achievement_category.microservice_categories[i]).sample
    end
end
