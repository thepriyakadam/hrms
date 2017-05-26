class CreateParticularVacancyRequests < ActiveRecord::Migration
  def change
    create_table :particular_vacancy_requests do |t|
      t.references :vacancy_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.string :candidate_name
      t.string :vacancy_name
      t.date :open_date
      t.date :closed_date
      t.date :fulfillment_date
      t.string :status
      t.boolean :is_complete
      t.integer :closed_position
      t.references :interview_schedule, index: true, foreign_key: true
      t.references :selected_resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
