class RemoveReferencesFromVacancyMaster < ActiveRecord::Migration
  def change
    remove_reference :vacancy_masters, :reporting_master, index: true, foreign_key: true
  end
end
