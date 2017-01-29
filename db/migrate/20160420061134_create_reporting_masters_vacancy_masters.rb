class CreateReportingMastersVacancyMasters < ActiveRecord::Migration
  def change
    create_table :reporting_masters_vacancy_masters do |t|
      t.references :vacancy_master, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
