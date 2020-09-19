class Microservice < ApplicationRecord
    after_create :ceil_price
    validates :price,
    presence: true, 
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

    has_one_attached :picture

    belongs_to :creatrix
    belongs_to :microservice_category

    has_many :microservice_requests
    has_many :achievements, through: :microservice_requests

    def ceil_price
        self.update(price: self.price.ceil(2))
    end
end