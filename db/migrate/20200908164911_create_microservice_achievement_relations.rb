class CreateMicroserviceAchievementRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :microservice_achievement_relations do |t|
      t.belongs_to :achievement, index: true
      t.belongs_to :microservice, index: true

      t.boolean :accepted?, default: false
      t.boolean :delivered?, default: false

      t.timestamps
    end
  end
end
