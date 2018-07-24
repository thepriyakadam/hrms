class AddColToVacancyMasters < ActiveRecord::Migration
  def change
     add_column :vacancy_masters, :vacancy_type, :string
     add_column :vacancy_masters, :experince_max, :string
     add_column :vacancy_masters, :budget_max, :string
     add_column :vacancy_masters, :reason, :text
     add_column :vacancy_masters, :notice_period, :string
  end
end
