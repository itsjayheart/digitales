class MicroserviceCategory < ApplicationRecord
  has_many :microservices
  has_many :microservice_requests

  belongs_to :achievement_category
  
  def microservice_request(node)
    microservice_category = self
    achievement_category = microservice_category.achievement_category
    achievement = Achievement.find_by(achievement_category: achievement_category, node: node)
    microservice_request = MicroserviceRequest.find_by(achievement: achievement, microservice_category: microservice_category)
    return microservice_request
  end

  def status(node)
    puts "checking status"
    microservice_category = self
    achievement_category = microservice_category.achievement_category
    achievement = Achievement.find_by(achievement_category: achievement_category, node: node)
    microservice_request = MicroserviceRequest.find_by(achievement: achievement, microservice_category: microservice_category)
    puts "node" + achievement.node.id.to_s if achievement
    puts "node" + node.id.to_s 
    puts "microservice_request" + microservice_request.id.to_s if microservice_request
    if !microservice_request
      return "idle"
    elsif !microservice_request.accepted?
      return "pending"
    elsif microservice_request.delivered?
      return "delivered"
    elsif microservice_request.accepted?
      fundraiser = microservice_request.fundraisers.last
      if fundraiser.current_fundings >= fundraiser.goal
        return "delivering"
      else
        return "funding"
      end
    else
      return "error"
    end
	end
end
