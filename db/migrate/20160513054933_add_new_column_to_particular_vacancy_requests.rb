class AddNewColumnToParticularVacancyRequests < ActiveRecord::Migration
  def change
    add_column :particular_vacancy_requests, :candidate_name, :string
  end
end
