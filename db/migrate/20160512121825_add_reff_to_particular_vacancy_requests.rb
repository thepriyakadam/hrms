class AddReffToParticularVacancyRequests < ActiveRecord::Migration
  def change
    add_reference :particular_vacancy_requests, :interview_schedule, index: true, foreign_key: true
    add_reference :particular_vacancy_requests, :selected_resume, index: true, foreign_key: true
  end
end
