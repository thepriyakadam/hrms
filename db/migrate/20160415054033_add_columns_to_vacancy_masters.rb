class AddColumnsToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :experience, :string
    add_column :vacancy_masters, :keyword, :string
    add_column :vacancy_masters, :others, :string
  end
end
