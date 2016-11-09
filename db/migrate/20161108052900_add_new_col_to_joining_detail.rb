class AddNewColToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :base_component, :string
  end
end
