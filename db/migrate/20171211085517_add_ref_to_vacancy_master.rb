class AddRefToVacancyMaster < ActiveRecord::Migration
  def change
  	add_reference :vacancy_masters, :sub_department, index: true, foreign_key: true
  end
end
