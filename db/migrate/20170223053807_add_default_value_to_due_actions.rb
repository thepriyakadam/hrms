class AddDefaultValueToDueActions < ActiveRecord::Migration
  def change
  	remove_column :due_actions, :status, :boolean
  	add_column :due_actions, :status, :boolean,  default: false
  end
end
