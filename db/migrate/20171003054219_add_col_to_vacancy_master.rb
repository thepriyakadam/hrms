class AddColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :relocation_cost, :string
  end
end
