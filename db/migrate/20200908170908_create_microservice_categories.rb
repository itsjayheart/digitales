class CreateMicroserviceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :microservice_categories do |t|
      t.belongs_to :achievement_category, index: true
      
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
