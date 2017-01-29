class AddRefToReportingMastersTravelRequests < ActiveRecord::Migration
  def change
    add_reference :reporting_masters_travel_requests, :daily_bill, index: true, foreign_key: true
  end
end
