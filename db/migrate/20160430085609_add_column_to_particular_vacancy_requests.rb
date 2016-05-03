class AddColumnToParticularVacancyRequests < ActiveRecord::Migration
  def change
  	add_column :particular_vacancy_requests, :is_complete, :boolean
  end
end
