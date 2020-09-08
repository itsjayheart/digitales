class NodAchievementRelation < ApplicationRecord
    belongs_to :nod
    belongs_to :achievement
end
