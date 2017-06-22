class CreateVacancyRequestStatuses < ActiveRecord::Migration
  def change
    create_table :vacancy_request_statuses do |t|
      t.references :vacancy_request, index: true, foreign_key: true
      t.references :action_by
      t.string :status
      t.date :action_date

      t.timestamps null: false
    end
  end
end
