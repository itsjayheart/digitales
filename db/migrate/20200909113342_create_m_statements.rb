class CreateMStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :m_statements do |t|
      t.string :sentence
      t.text :description

      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
