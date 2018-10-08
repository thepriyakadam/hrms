class CreateExpenceOpestions < ActiveRecord::Migration
  def change
    create_table :expence_opestions do |t|
      t.references :employee_grade, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
