class AddEmpRefToVacancyMasters < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :employee, index: true, foreign_key: true
  end
end
