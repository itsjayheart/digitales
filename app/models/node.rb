class Node < ApplicationRecord
    belongs_to :nodeable, polymorphic: true
    belongs_to :creatrix, polymorphic: true
    has_many :node_achievement_relations
    has_many :achievements, through: :node_achievement_relations
end
