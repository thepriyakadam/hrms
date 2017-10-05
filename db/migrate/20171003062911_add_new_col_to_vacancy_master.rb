class AddNewColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :relocation_rerimbursement, :boolean
  end
end
