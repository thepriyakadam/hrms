class AddNewColmnToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :experience, :string
    add_column :vacancy_masters, :keyword, :text
  end
end
