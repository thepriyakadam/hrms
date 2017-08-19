class CreateReportingMastersTrainingReqs < ActiveRecord::Migration
  def change
    create_table :reporting_masters_training_reqs do |t|
      t.references :training_request, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.string :training_status
      t.string :employee_training

      t.timestamps null: false
    end
  end
end
