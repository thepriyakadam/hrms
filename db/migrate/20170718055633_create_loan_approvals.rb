class CreateLoanApprovals < ActiveRecord::Migration
  def change
    create_table :loan_approvals do |t|
      t.references :loan_request, index: true, foreign_key: true
      t.references :membership, index: true, foreign_key: true
      t.references :loan_type, index: true, foreign_key: true
      t.references :approval
      t.decimal :amount ,scale: 2 ,precision: 15
      t.integer :no_of_emi
      t.decimal :emi,scale: 2 ,precision: 15
      t.date :loan_request_date
      t.date :loan_approval_date
      t.string :status

      t.timestamps null: false
    end
  end
end
