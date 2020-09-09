class CreateNodeAchievementRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :node_achievement_relations do |t|
      t.belongs_to :node, index: true
      t.belongs_to :achievement, index: true
      t.timestamps
    end
  end
end
