class DonatedSum < ApplicationRecord
    
    after_create :ceil_price

    validates :sum,
    presence: true, 
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

    belongs_to :creatrix
    belongs_to :fundraiser

    def ceil_price
        self.update(sum: self.sum.ceil(2))
    end

end
