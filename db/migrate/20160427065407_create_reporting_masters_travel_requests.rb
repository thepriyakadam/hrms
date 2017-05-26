class CreateReportingMastersTravelRequests < ActiveRecord::Migration
  def change
    create_table :reporting_masters_travel_requests do |t|
      t.references :travel_request, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.string :travel_status
      t.boolean :status
      t.text :daily_bill_comment
      t.timestamps null: false
    end
  end
end
