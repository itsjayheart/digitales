class CreateGgMStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :gg_m_statements do |t|
      t.string :title
      t.string :description
      t.belongs_to :digitale, foreign_key: true

      t.timestamps
    end
  end
end
