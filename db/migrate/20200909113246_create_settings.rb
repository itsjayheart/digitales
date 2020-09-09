class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :full_name
      t.text :description

      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
