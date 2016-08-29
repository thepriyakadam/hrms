class AddNewColumnToReportingMasters < ActiveRecord::Migration
  def change
    add_column :reporting_masters, :is_expences, :boolean
  end
end
