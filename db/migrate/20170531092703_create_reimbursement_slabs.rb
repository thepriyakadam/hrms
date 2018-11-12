class CreateReimbursementSlabs < ActiveRecord::Migration
  def change
    create_table :reimbursement_slabs do |t|
      t.references :reimbursement_head, index: true, foreign_key: true
      t.references :employee_grade, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.decimal :from,precision: 10, scale: 2, default: 0
      t.decimal :to,precision: 10, scale: 2, default: 0
      t.decimal :monthly_amount,precision: 10, scale: 2, default: 0
      t.decimal :yearly_amount,precision: 10, scale: 2, default: 0
      t.boolean :status

      t.timestamps null: false
    end
  end
end
