class AddRefToParticularVacancyRequests < ActiveRecord::Migration
  def change
    add_reference :particular_vacancy_requests, :employee_designation, index: true, foreign_key: true
    add_column :particular_vacancy_requests, :vacancy_name, :string
  end
end
