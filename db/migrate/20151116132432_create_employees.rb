class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      
      t.string :manual_employee_code
      t.string :employee_code, index: true
      t.string :employees, :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :contact_no
      t.string :optinal_contact_no
      t.string :email
      t.text :permanent_address
      t.references :country, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.string :city
      t.integer :pin_code
      t.text :current_address
      t.string :adhar_no
      t.string :pan_no
      t.string :licence_no
      t.string :marital_status
      t.references :nationality, index: true, foreign_key: true
      t.references :blood_group, index: true, foreign_key: true
      t.string :handicap
      t.string :handicap_type
      t.string :status
      t.references :employee_type, index: true, foreign_key: true
      t.string :gender
      t.references :manager, index: true
      t.references :department, index: true, foreign_key: true
      t.references :religion, index: true, foreign_key: true
  

      t.timestamps null: false
    end
    add_reference :members, :employee, index: true, foreign_key: true
  end
end
