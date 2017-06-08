class ReportingMaster < ActiveRecord::Migration
  def change
  	add_column :reporting_masters, :is_active, :boolean
  end
end
