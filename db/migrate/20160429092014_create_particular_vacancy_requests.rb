class CreateParticularVacancyRequests < ActiveRecord::Migration
  def change
    create_table :particular_vacancy_requests do |t|
      t.references :vacancy_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.date :open_date
      t.date :closed_date
      t.date :fulfillment_date
      t.string :status

      t.timestamps null: false
    end
  end
end
