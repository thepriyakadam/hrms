class AddJustificationToVacancyMasters < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :justification, :text
  end
end
