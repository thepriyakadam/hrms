class RemovePlanReasonMasterIdIdFromEmployeePlans < ActiveRecord::Migration
  def change
    remove_column :employee_plans, :plan_reason_master_id_id, :integer
  end
end
