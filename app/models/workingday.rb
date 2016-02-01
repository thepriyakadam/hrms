class Workingday < ActiveRecord::Base
  belongs_to :employee
  has_many :salaryslips

  # validates :month_name, :presence => true
  # validates :year, :presence => true
  # validates :day_in_month, :presence => true
  # validates :present_day, :presence => true
  # validates :total_leave, :presence => true
  # validates :holiday_in_month, :presence => true
  # validates :week_off_day, :presence => true
  # validates :absent_day, :presence => true
  # validates :payable_day, :presence => true
end
