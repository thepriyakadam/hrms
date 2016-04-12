class Instalment < ActiveRecord::Base
  belongs_to :advance_salary
  # validates :advance_salary_id, uniqueness: { scope: [:instalment_date] }
end
