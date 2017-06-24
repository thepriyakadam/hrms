class CreateVacancyRequests < ActiveRecord::Migration
  def change
    create_table :vacancy_requests do |t|
      t.string :vacancy
      t.integer :no_of_position
      t.text :description
      t.references :request_by
      t.references :approval_by
      t.date :request_date
      t.string :qualification
      t.text :skill_set
      t.references :employee_designation, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.string :experience
      t.string :current_status
      t.string :vacancy_type

      t.timestamps null: false
    end
  end
end
