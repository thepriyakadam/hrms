class CreateExpensesMasters < ActiveRecord::Migration
  def change
    create_table :expenses_masters do |t|
      t.references :expence_opestion, index: true, foreign_key: true
      t.references :mode, index: true, foreign_key: true
      t.string :billing_opestion
      t.references :billing_option, index: true, foreign_key: true
      t.references :employee_grade, index: true, foreign_key: true
      t.float :min_amount
      t.float :max_amount
      t.boolean :status

      t.timestamps null: false
    end
  end
end
