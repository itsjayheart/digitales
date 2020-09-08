class CreateNodAchievementRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :nod_achievements_relations do |t|
      t.belongs_to :nod, index: true
      t.belongs_to :achievement, index: true
      t.timestamps
    end
  end
end
