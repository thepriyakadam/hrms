class AddNewColumnToReportingMastersTravelRequests < ActiveRecord::Migration
  def change
    add_column :reporting_masters_travel_requests, :daily_bill_comment, :text
  end
end
