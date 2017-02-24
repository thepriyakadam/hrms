class AddNewColToDueActions < ActiveRecord::Migration
  def change
    add_column :due_actions, :is_confirm, :boolean
    add_column :due_actions, :status, :boolean
  end
end
