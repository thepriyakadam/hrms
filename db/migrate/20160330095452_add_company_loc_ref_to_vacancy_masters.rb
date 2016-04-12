class AddCompanyLocRefToVacancyMasters < ActiveRecord::Migration
  def change
    remove_column :vacancy_masters, :job_title, :string
    remove_column :vacancy_masters, :department_name, :string
    add_reference :vacancy_masters, :company_location, index: true, foreign_key: true
  end
end
