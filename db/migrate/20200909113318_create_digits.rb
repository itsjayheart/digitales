class CreateDigits < ActiveRecord::Migration[5.2]
  def change
    create_table :digits do |t|
      t.string :title
      t.text :description

      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
