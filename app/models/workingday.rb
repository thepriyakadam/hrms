class Workingday < ActiveRecord::Base
  #enum month: [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  enum month: { January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12 }
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
