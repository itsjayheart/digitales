class DropJoinTable < ActiveRecord::Migration[5.2]
  def change
    drop_table (node_achievement_relations)
  end
end
