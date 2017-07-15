class AddRefToVacancyMaster < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :reporting_master
  end
end
