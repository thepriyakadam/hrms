class Workingday < ActiveRecord::Base
  #enum month: [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  enum month: { January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12 }
  validates :employee_id, uniqueness: { scope: [:month_name, :year] }
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

  def self.day(i)
    case i
      when 1
        31
      when 2
        28
      when 3
        31
      when 4
        30
      when 5
        31
      when 6
        30
      when 7
        31
      when 8
        31
      when 9
        30
      when 10
        31
      when 11
        30
      when 12
        31
    end
  end

  def self.find_by_role(workingdays, current_user)
    if current_user.class == Group
      Employee.where(id: workingdays)
    else
      if current_user.role.name == "Company"
        Employee.where(id: workingdays)
      elsif current_user.role.name == "CompanyLocation"
        puts "------------------------------------------------------"
        puts workingdays.count
        puts current_user.manual_member_code
        puts "------------------------------------------------------"
        Employee.where(id: workingdays, company_location_id: current_user.company_location_id)
      end
    end
  end
end
