class Microservice < ApplicationRecord
    validates :price,
    presence: true, 
    numericality: true,
    numericality: { greater_than: 0.99e2, less_than: 0.501e3}

    belongs_to :manufacturer, class_name: "Creatrix"
    belongs_to :microservice_category
    has_many :microservice_achievement_relations
    has_many :achievments, through: :microservice_achievement_relations
    has_many :fundraisers

end
