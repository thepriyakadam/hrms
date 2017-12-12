class AddNewColoumToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :billable, :string
  end
end
