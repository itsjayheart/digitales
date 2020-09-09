class MicroserviceAchievementRelation < ApplicationRecord
    belongs_to :achievement
    belongs_to :microservice

    has_many :fundraisers
end
