class AddReffToLeaveTransfers < ActiveRecord::Migration
  def change
    add_reference :leave_transfers, :leav_category, index: true, foreign_key: true
  end
end
