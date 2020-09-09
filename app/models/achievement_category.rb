class AchievementCategory < ApplicationRecord

	has_many :achievements
	has_many :microservice_categories

end
