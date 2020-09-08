class CreateDonatedSums < ActiveRecord::Migration[5.2]
  def change
    create_table :donated_sums do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
