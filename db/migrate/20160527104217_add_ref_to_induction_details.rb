class AddRefToInductionDetails < ActiveRecord::Migration
  def change
    add_reference :induction_details, :induction_activity, index: true, foreign_key: true
  end
end
