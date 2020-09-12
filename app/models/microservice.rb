class Microservice < ApplicationRecord

    validates :price,
    presence: true, 
    numericality: { greater_than_or_equal_to: 0.99e2, less_than_or_equal_to: 0.501e3 }

    has_one_attached :picture

    belongs_to :creatrix
    belongs_to :microservice_category

    has_many :microservice_requests
    has_many :achievements, through: :microservice_requests

end
