class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :department, index: true, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :contact_no
      t.string :email
      t.string :permanent_address
      t.string :city
      t.string :district
      t.string :state
      t.integer :pin_code
      t.string :current_address
      t.string :adhar_no
      t.string :pan_no
      t.string :licence_no
      t.string :passport_no
      t.string :marital_status
      t.references :nationality, index: true, foreign_key: true
      t.references :blood_group, index: true, foreign_key: true
      t.string :handicap
      t.string :status
      t.references :employee_type, index: true, foreign_key: true
      t.string :gender

      t.timestamps null: false
    end
  end
end
