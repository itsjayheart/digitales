class Microservice < ApplicationRecord
    validates :price,
    presence: true, 
    numericality: true,
    numericality: { greater_than: 0.99e2, less_than: 0.501e3}
end
