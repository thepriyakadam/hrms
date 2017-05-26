class AddNewColumnToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :particular_vacancy_requests, :closed_position, :integer
  end
end
