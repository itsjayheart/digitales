class NodeAchievementRelation < ApplicationRecord
    belongs_to :node
    belongs_to :achievement
end
