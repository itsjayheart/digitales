class AddTitleToDigitales < ActiveRecord::Migration[5.2]
  def change
    add_column :digitales, :title, :string
  end
end
