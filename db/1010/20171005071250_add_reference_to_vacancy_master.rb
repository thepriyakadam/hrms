class AddReferenceToVacancyMaster < ActiveRecord::Migration
  def change
    add_reference :vacancy_masters, :recruiter
  end
end
