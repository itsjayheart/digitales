class CreateDonatedSums < ActiveRecord::Migration[5.2]
  def change
    create_table :donated_sums do |t|
      t.decimal :sum

      t.belongs_to :fundraiser, index: true
      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
