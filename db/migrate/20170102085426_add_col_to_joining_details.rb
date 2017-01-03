class AddColToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :ot_option, :boolean
  end
end
