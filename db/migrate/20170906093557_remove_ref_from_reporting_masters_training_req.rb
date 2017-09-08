class RemoveRefFromReportingMastersTrainingReq < ActiveRecord::Migration
  def change
     remove_reference :reporting_masters_training_reqs, :reporting_master, index: true, foreign_key: true
    add_reference :reporting_masters_training_reqs, :reporting_master
  end
end
