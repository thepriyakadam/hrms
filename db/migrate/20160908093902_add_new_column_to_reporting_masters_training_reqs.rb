class AddNewColumnToReportingMastersTrainingReqs < ActiveRecord::Migration
  def change
    add_column :reporting_masters_training_reqs, :employee_training, :string
  end
end
