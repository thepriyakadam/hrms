class AddDateColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :vacancy_of, :string
    add_column :vacancy_masters, :target_date, :date
  end
end
