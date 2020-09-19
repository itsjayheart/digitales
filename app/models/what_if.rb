class WhatIf < ApplicationRecord

	belongs_to :creatrix

	has_one :node, as: :nodeable


    validates :title, length: { in: 3..30 }

    validates :content, length: { in: 50..500 }

end
