class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.references :membership, index: true, foreign_key: true
      t.date :date
      t.references :loan_type, index: true, foreign_key: true
      t.references :request_to
      t.decimal  :amount , scale: 2 ,precision: 15
      t.integer :no_of_emi
      t.decimal :emi,scale: 2 ,precision: 15
      t.decimal :interest_amount , scale: 2 ,precision: 15
      t.string :status
      

      t.timestamps null: false
    end
  end
end
