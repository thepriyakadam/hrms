class AddNewColToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :basis_of_time, :boolean,  default: false
  end
end
