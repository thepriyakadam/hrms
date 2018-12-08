class CreateShortLeaveApprovals < ActiveRecord::Migration
  def change
    create_table :short_leave_approvals do |t|
      t.references :short_leave_request, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
