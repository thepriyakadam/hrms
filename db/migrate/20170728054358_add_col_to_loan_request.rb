class AddColToLoanRequest < ActiveRecord::Migration
  def change
    add_column :loan_requests, :interest_amount, :decimal
  end
end
