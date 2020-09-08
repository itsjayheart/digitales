class Fundraiser < ApplicationRecord
    belongs_to :creatrix
    belongs_to :microservice_achievement_relation
    has_may :donated_sum
end
