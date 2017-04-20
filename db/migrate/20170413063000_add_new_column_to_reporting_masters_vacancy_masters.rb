class AddNewColumnToReportingMastersVacancyMasters < ActiveRecord::Migration
  def change
  	add_column :reporting_masters_vacancy_masters, :vacancy_status, :string
  end
end
