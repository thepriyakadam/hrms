class AddReffToVacancyRequest < ActiveRecord::Migration
  def change
    add_reference :vacancy_requests, :recruiter, index: true, foreign_key: true
  end
end
