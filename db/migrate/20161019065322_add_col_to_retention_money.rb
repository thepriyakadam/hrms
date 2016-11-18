class AddColToRetentionMoney < ActiveRecord::Migration
  def change
  	add_column :retention_moneys, :is_persent, :boolean
    add_column :retention_moneys, :persent, :decimal
  	add_column :retention_moneys, :max_limit, :string
    add_column :retention_moneys, :base_component, :string
  	add_column :retention_moneys, :is_active, :boolean
  end
end
