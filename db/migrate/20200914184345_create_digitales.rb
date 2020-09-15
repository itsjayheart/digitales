class CreateDigitales < ActiveRecord::Migration[5.2]
  def change
    create_table :digitales do |t|
      t.belongs_to :creatrix, index: true

      t.timestamps
    end
  end
end
