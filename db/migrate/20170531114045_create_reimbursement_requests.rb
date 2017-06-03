class CreateReimbursementRequests < ActiveRecord::Migration
  def change
    create_table :reimbursement_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :reimbursement_head, index: true, foreign_key: true
      t.date :date
      t.decimal :amount,precision: 10, scale: 2, default: 0
      t.string :status
      t.references :approval

      t.timestamps null: false
    end
  end
end
