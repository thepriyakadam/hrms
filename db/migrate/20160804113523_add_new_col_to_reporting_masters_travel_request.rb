class AddNewColToReportingMastersTravelRequest < ActiveRecord::Migration
  def change
    add_column :reporting_masters_travel_requests, :status, :boolean
  end
end
