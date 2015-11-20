class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :company_location, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :department_type
      t.string :address
      t.integer :pin_code
      t.string :head_of_department
      t.string :contact_no
      t.string :manager
      t.string :hr

      t.timestamps null: false
    end
  end
end
