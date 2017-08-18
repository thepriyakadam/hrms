class AddRefferenceToVacancyMaster < ActiveRecord::Migration
  def change
    remove_reference :vacancy_masters, :recruiter, index: true, foreign_key: true
    add_reference :vacancy_masters, :recruiter
  end
end
