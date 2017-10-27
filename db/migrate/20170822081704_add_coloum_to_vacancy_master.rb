class AddColoumToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :secondary_skill, :string
  end
end
