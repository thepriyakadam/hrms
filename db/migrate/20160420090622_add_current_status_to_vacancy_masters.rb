class AddCurrentStatusToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :current_status, :string
    add_column :reporting_masters_vacancy_masters, :vacancy_status, :string
  end
end
