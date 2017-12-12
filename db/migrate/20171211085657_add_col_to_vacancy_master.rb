class AddColToVacancyMaster < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :cost_center, index: true, foreign_key: true
  end
end
