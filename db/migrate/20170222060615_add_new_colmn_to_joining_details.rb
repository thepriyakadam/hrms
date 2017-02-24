class AddNewColmnToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :leaving_date, :date
  end
end
