class AddReffToVacancyMasters < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :reporting_master, index: true, foreign_key: true
  end
end
