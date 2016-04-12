class AddChangeColumnNullToUserEmail < ActiveRecord::Migration
  def self.up
    change_column :members, :email, :string, null: true
  end

  def self.down
    change_column :members, :email, :string, null: false
  end
end
