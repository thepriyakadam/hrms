class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :company_location, index: true, foreign_key: true
      t.string :department_code
      t.text :description
      t.string :name
      t.references :department_type, index: true, foreign_key: true
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
