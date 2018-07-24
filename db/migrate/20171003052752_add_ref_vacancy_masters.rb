class AddRefVacancyMasters < ActiveRecord::Migration
  def change
  	add_reference :vacancy_masters, :target_company, index: true, foreign_key: true
  end
end
