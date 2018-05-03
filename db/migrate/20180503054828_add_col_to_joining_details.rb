class AddColToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :c_off_applicable_day, :decimal
  end
end
