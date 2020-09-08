class Node < ApplicationRecord
    belongs_to :nodeable, polymorphic: true
    belongs_to :creatrix, polymorphic: true
    has_many :achievement, through: :node_achievement_relations
end
