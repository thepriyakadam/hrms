class AddNewColumnToJoiningDetails < ActiveRecord::Migration
  def change
    add_column :joining_details, :is_employeer_pf, :boolean
    add_column :joining_details, :is_employeer_esic, :boolean
    add_column :joining_details, :is_insurance, :boolean
  end
end
