class CreateDueActions < ActiveRecord::Migration
  def change
    create_table :due_actions do |t|
      t.references :due_detail, index: true, foreign_key: true

      t.references :due_employee_detail, index: true, foreign_key: true
      t.string :name
      t.text :remark
      t.decimal :amount

      t.boolean :is_confirm
      t.boolean :status

      t.timestamps null: false
    end
  end
end
