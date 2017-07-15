class AddColToVacancyMaster < ActiveRecord::Migration
  def change
    add_column :vacancy_masters, :vacancy_type, :string
    add_column :vacancy_masters, :string, :string
    add_column :vacancy_masters, :experince_max, :string
    add_column :vacancy_masters, :budget_max, :string
    add_column :vacancy_masters, :reason, :string
    add_reference :vacancy_masters, :replacement
    add_column :vacancy_masters, :notice_period, :boolean
    add_column :vacancy_masters, :notice_period_day, :string
    add_column :vacancy_masters, :relocation_rerimbursement, :boolean
    add_column :vacancy_masters, :relocation_cost, :string
  end
end
