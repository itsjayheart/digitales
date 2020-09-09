class MStatement < ApplicationRecord

	belongs_to :creatrix

	has_one :node, as: :nodeable
	
end
