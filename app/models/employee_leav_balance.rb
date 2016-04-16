class EmployeeLeavBalance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  belongs_to :company_leav
  validates :employee_id, uniqueness: { scope: [:leav_category_id] }
  validates :no_of_leave, presence: true
  validates :expiry_date, presence: true

  def self.count_leave(month)
    case month
    when '1'
      3
    when '2'
      2
    when '3'
      1
    when '4'
      12
    when '5'
      11
    when '6'
      10
    when '7'
      9
    when '8'
      8
    when '9'
      7
    when '10'
      6
    when '11'
      5
    when '12'
      4
    end
  end
end
