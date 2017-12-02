class RemoveRefInToVacancyMasters < ActiveRecord::Migration
  def change
    remove_reference :vacancy_masters, :reporting_master, index: true, foreign_key: true
     add_reference :vacancy_masters, :reporting_master
  end
end
