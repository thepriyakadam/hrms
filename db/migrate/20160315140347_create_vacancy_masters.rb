class CreateVacancyMasters < ActiveRecord::Migration
  def change
    create_table :vacancy_masters do |t|
      t.string :vacancy_name
      t.integer :no_of_position
      t.text :description
      t.date :vacancy_post_date
      t.string :budget

      t.references :department, index: true, foreign_key: true
      t.references :company_location, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true

      t.references :degree, index: true, foreign_key: true
      t.references :degree_1, index: true, foreign_key: true
      t.references :degree_2, index: true, foreign_key: true

      t.references :reporting_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.string :other_organization
      t.string :industry
      t.string :current_status

      t.timestamps null: false
    end
  end
end
