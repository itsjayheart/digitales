class AddDescriptionToDigitales < ActiveRecord::Migration[5.2]
  def change
    add_column :digitales, :description, :string
  end
end
