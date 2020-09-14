class AddMediaType < ActiveRecord::Migration[5.2]
  def change
    add_column :microservice_categories, :media_type, :string
    add_column :microservices, :youtube, :string
    add_column :microservices, :soundcloude, :text
    add_column :microservices, :quill, :text
    add_column :microservice_requests, :youtube, :string
    add_column :microservice_requests, :soundcloude, :text
    add_column :microservice_requests, :quill, :text
  end
end
