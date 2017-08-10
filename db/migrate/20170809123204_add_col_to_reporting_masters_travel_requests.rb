class AddColToReportingMastersTravelRequests < ActiveRecord::Migration
  def change
    remove_reference :reporting_masters_travel_requests, :reporting_master, index: true, foreign_key: true
    add_reference :reporting_masters_travel_requests, :reporting_master
  end
end
