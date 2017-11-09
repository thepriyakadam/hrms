class AddNewColumnnToVacancyMasters < ActiveRecord::Migration
  def change
  	 add_column :vacancy_masters, :vacancy_fullfillment_date, :date
  	 add_column :vacancy_masters, :is_confirmed, :boolean
  	 add_column :interview_schedules, :is_confirmed, :boolean
  end
end
