class MicroserviceAchievementRelation < ApplicationRecord
    belongs_to :achievement
    belongs_to :microservice

    has_one :fundraiser
end
