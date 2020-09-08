class CreateMicroserviceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :microservice_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
