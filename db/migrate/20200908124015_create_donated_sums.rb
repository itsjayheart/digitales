class CreateDonatedSums < ActiveRecord::Migration[5.2]
  def change
    create_table :donated_sums do |t|
      t.decimal :amount
      t.belongs_to :foundraiser, index: true
      t.belongs_to :creatrix, index: true
      t.timestamps
    end
  end
end
