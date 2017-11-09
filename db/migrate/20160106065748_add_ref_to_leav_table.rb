class AddRefToLeavTable < ActiveRecord::Migration
  def change
    add_reference :leav_approveds, :employee, index: true, foreign_key: true
    add_reference :leav_rejecteds, :employee, index: true, foreign_key: true
    add_reference :leav_cancelleds, :employee, index: true, foreign_key: true
  end
end
