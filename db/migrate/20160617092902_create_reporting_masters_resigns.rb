class CreateReportingMastersResigns < ActiveRecord::Migration
  def change
    create_table :reporting_masters_resigns do |t|
      t.references :employee_resignation, index: true, foreign_key: true
      t.references :reporting_master
      t.string :resignation_status

      t.timestamps null: false
    end
  end
end
