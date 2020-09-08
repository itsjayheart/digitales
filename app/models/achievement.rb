class Achievement < ApplicationRecord
    belongs_to :achievement_category
    has_many :node_achievement_relations
    has_many :nodes, through: :node_achievement_relations
    has_many :microservice_achievement_relations
    has_many :microservices, through: :microservice_achievement_relations
end
