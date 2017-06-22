class AddColToVacancyRequest < ActiveRecord::Migration
  def change
    add_reference :vacancy_requests, :employee_designation, index: true, foreign_key: true
    # remove_reference :vacancy_requests, :designation
  end
end
