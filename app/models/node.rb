class Node < ApplicationRecord
    after_create :first_achievement

    belongs_to :nodeable, polymorphic: true
    belongs_to :creatrix

    belongs_to :digitale

    has_many :achievements

    def non_achieved
    	return self.achievements.select { |achievement| achievement.achieved? == false }[0]
    end
    
    def current_fundraiser
    	return Fundraiser.where(funded?: false, microservice_request: MicroserviceRequest.where(achievement: self.non_achieved).sample).sample
    end

    def current_microservice
      i = self.non_achieved.microservices.count - 1
      
		  return self.non_achieved.microservices.select { |microservice| microservice.microservice_category == self.non_achieved.achievement_category.microservice_categories[i]}.sample
    end

    def current_microservice_category
      i = 0
      self.non_achieved.microservices.each do |microservice|
        i += 1
      end
      id = MicroserviceCategory.where(achievement_category: self.non_achieved.achievement_category)[0].id + i
      return MicroserviceCategory.find(id)
    end

    def first_achievement
      Achievement.create(node: self, achievement_category: AchievementCategory.first)
    end

end
