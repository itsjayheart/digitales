class AddOrderToGgMStatements < ActiveRecord::Migration[5.2]
  def change
    add_column :gg_m_statements, :order, :integer
  end
end
