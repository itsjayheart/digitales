class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.references :nodeable, polymorphic: true
      t.references :creatrix, polymorphic: true
      t.timestamps
    end
  end
end
