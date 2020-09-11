class Achievement < ApplicationRecord

    belongs_to :achievement_category

    belongs_to :node

    has_many :microservice_requests
    has_many :microservices, through: :microservice_requests
    
end
