class RemoveDateColToVacancyMaster < ActiveRecord::Migration
  def change
    remove_column :vacancy_masters, :target_date, :date
  end
end
