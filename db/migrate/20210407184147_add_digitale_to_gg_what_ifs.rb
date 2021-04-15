class AddDigitaleToGgWhatIfs < ActiveRecord::Migration[5.2]
  def change
    add_reference :gg_what_ifs, :digitale, foreign_key: true
  end
end
