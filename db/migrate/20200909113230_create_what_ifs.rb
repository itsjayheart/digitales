class CreateWhatIfs < ActiveRecord::Migration[5.2]
  def change
    create_table :what_ifs do |t|
      t.string :sentence
      t.text :description

      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
