class AddFeedbackToEmployeePlans < ActiveRecord::Migration
  def change
    add_reference :employee_plans, :plan_reason_master, index: true, foreign_key: true
    add_column :employee_plans, :feedback, :text
  end
end
