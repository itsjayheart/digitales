class CreateMicroservices < ActiveRecord::Migration[5.2]
  def change
    create_table :microservices do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
