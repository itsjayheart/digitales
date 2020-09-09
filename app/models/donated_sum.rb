class DonatedSum < ApplicationRecord

    validates :sum,
    presence: true, 
    numericality: { greater_than: 0.99e2, less_than: 0.501e3 }

    belongs_to :creatrix
    belongs_to :fundraiser

end
