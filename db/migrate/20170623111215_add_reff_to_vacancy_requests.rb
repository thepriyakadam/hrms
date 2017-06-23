class AddReffToVacancyRequests < ActiveRecord::Migration
  def change
    add_reference :vacancy_requests, :recruiter
  end
end
