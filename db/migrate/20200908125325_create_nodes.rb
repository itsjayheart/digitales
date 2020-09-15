class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :title
      t.text :content

      t.belongs_to :creatrix, index: true
      t.references :nodeable, polymorphic: true
      t.belongs_to :digitale, index: true
      
      t.timestamps
    end
  end
end