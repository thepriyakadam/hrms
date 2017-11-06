class CreateVacancyMasters < ActiveRecord::Migration
  def change
    create_table :vacancy_masters do |t|
      t.string :vacancy_name
      t.integer :no_of_position
      t.text :description
      t.text :justification
      t.date :vacancy_post_date
      t.string :budget
      t.references :department, index: true, foreign_key: true
      t.references :company_location, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.references :degree, index: true, foreign_key: true
      t.references :degree_1
      t.references :degree_2
      t.references :reporting_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :other_organization
      t.string :industry
      t.string :current_status
      t.date :vacancy_fullfillment_date
      t.boolean :is_confirmed
      t.string :vacancy_code
      t.string :experience
      t.string :keyword

      t.timestamps null: false
    end
  end
end
