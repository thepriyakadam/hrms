class AddRefToVacancyMasters < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :department, index: true, foreign_key: true
    add_reference :vacancy_masters, :employee_designation, index: true, foreign_key: true
  end
end
