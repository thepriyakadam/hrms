class AddColToLeaveTransfer < ActiveRecord::Migration
  def change
    add_column :leave_transfers, :reason, :string
  end
end
