class CreateReimbursementSlabs < ActiveRecord::Migration
  def change
    create_table :reimbursement_slabs do |t|
      t.references :reimbursement_head, index: true, foreign_key: true
      t.references :employee_grade, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.decimal :from
      t.decimal :to
      t.decimal :monthly_amount
      t.decimal :yearly_amount
      t.boolean :status

      t.timestamps null: false
    end
  end
end
