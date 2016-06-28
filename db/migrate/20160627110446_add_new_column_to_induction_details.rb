class AddNewColumnToInductionDetails < ActiveRecord::Migration
  def change
    add_column :induction_details, :end_date, :date
    remove_reference :induction_details, :induction_activity, index: true, foreign_key: true
  end
end