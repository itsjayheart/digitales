class Node < ApplicationRecord
	
    belongs_to :nodeable, polymorphic: true
    belongs_to :creatrix

    has_many :achievements
    
end
