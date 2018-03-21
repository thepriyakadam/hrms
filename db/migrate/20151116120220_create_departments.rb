class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :company_location, index: true, foreign_key: true
      t.string :manual_department_code
      t.string :department_code
      t.text :description
      t.string :name
      t.references :department_type, index: true, foreign_key: true
      t.string :contact_no
      t.boolean :is_confirm

      t.timestamps null: false
    end
    add_reference :members, :department, index: true, foreign_key: true
    
  end
end
