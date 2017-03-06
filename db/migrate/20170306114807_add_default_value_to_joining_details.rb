class AddDefaultValueToJoiningDetails < ActiveRecord::Migration
  def change
  	remove_column :joining_details, :is_new, :boolean
  	add_column :joining_details, :is_new, :boolean,  default: true
  end
end
