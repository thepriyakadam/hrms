class AddExpenceOpestionAndModeAndOpestionToDailyBillDetails < ActiveRecord::Migration
  def change
    add_reference :daily_bill_details, :expence_opestion, index: true, foreign_key: true
    add_reference :daily_bill_details, :mode, index: true, foreign_key: true
    add_reference :daily_bill_details, :billing_option, index: true, foreign_key: true
    add_column :daily_bill_details, :billing_opestion, :string
  end
end
