class AddColToMembers < ActiveRecord::Migration
  def change
    add_column :members, :current_status, :boolean
  end
end
