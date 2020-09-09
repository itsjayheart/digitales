class Microservice < ApplicationRecord

    validates :price,
    presence: true, 
    numericality: { greater_than_or_equal_to: 0.99e2, less_than_or_equal_to: 0.501e3 }

    belongs_to :creatrix
    belongs_to :microservice_category

    has_many :microservice_achievement_relations
    has_many :achievements, through: :microservice_achievement_relations

end
