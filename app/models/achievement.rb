class Achievement < ApplicationRecord

    belongs_to :achievement_category

    belongs_to :node

    has_many :microservice_achievement_relations
    has_many :microservices, through: :microservice_achievement_relations
    
end
