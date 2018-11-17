class AddColToJoiningDetails1 < ActiveRecord::Migration
  def change
    add_column :joining_details, :contact_library, :boolean
  end
end
