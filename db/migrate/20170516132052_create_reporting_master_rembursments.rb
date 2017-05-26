class CreateReportingMasterRembursments < ActiveRecord::Migration
  def change
    create_table :reporting_master_rembursments do |t|
      t.references :rembursment, index: true, foreign_key: true
      t.references :manager
      t.boolean :status

      t.timestamps null: false
    end
  end
end
