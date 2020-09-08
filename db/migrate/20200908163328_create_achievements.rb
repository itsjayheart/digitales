class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.belongs_to :achievement_category, index: true
      t.timestamps
    end
  end
end
