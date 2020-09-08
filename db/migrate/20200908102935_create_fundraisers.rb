class CreateFundraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraisers do |t|
      t.belongs_to :creatrix, index: true
      t.belongs_to :microservice_achievement_relation, index: true

      t.decimal :goal

      t.timestamps
    end
  end
end
