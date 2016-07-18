class CreateEmployeeDocuments < ActiveRecord::Migration
  def change
    create_table :employee_documents do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
