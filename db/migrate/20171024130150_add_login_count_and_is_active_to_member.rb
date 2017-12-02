class AddLoginCountAndIsActiveToMember < ActiveRecord::Migration
  def change
    add_column :members, :login_count, :integer, :null => false, :default => 0
    add_column :members, :is_active, :boolean, default: false
  end
end
