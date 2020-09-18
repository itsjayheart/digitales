class AchievementCategory < ApplicationRecord

	has_many :achievements
	has_many :microservice_categories

  def bootstap_class(node)
    achievement_category = self
    current_achievment = node.non_achieved
    achievement = Achievement.find_by(achievement_category: achievement_category, node: node)
    if current_achievment == achievement
      return "text-primary"
    elsif achievement.achieved?
      return "text-success"
    else
      return "text-secondary"
    end
  end
end
