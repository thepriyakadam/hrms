class ChangeColFromRetentionMoney < ActiveRecord::Migration
  def change
  	remove_column :retention_moneys, :is_persent, :boolean
  	add_column :retention_moneys, :is_persent, :string
  end
end
