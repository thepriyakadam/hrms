class AddColumnRetirementDateToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :retirement_date, :date
    add_reference :joining_details, :reserved_category, index: true, foreign_key: true
  end
end
