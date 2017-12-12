class AddNewColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :vacancy_type, :string
  end
end
