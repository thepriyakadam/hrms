class AddNewColumnnToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :is_family_pension, :boolean
    add_column :joining_details, :is_bonus, :boolean
  end
end
