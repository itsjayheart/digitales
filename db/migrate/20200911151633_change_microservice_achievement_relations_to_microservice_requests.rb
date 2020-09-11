class ChangeMicroserviceAchievementRelationsToMicroserviceRequests < ActiveRecord::Migration[5.2]
  def change
    rename_table :microservice_achievement_relations, :microservice_requests
  end
end
