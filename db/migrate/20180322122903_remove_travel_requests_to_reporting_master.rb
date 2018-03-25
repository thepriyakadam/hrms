class RemoveTravelRequestsToReportingMaster < ActiveRecord::Migration
  def change
    remove_reference :travel_requests, :reporting_master, index: true, foreign_key: true
  end
end
