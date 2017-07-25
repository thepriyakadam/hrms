class AddColToVacancyMasters < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :recruiter, index: true, foreign_key: true
  end
end
