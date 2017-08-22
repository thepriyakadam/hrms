class AddReffToReportingMastersVacancyMaster < ActiveRecord::Migration
  def change
  	remove_reference :reporting_masters_vacancy_masters, :reporting_master, index: true, foreign_key: true
    add_reference :reporting_masters_vacancy_masters, :reporting_master
  end
end
