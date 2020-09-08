class CreateFundraisers < ActiveRecord::Migration[5.2]
  def change
    create_table :fundraisers do |t|
      t.belongs_to :creatrix, index: true

      t.decimal :goal

      t.timestamps
    end
  end
end
