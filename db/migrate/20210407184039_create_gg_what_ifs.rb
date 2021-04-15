class CreateGgWhatIfs < ActiveRecord::Migration[5.2]
  def change
    create_table :gg_what_ifs do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
