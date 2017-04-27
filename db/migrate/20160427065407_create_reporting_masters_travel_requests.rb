class CreateReportingMastersTravelRequests < ActiveRecord::Migration
  def change
    create_table :reporting_masters_travel_requests do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
