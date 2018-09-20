class TravelRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :travel_option
  belongs_to :travel_mode
  belongs_to :project_master
  has_many :daily_bill_details
  has_many :reporting_masters_travel_requests
  has_many :reporting_masters, through: :reporting_masters_travel_requests
  validates :tour_purpose, presence: true
  validates :place, presence: true
  
  validates :traveling_date, presence: true

  def is_there?
    flag = 0
    flag1 = 0
    flag2 = 0
      flag = TravelRequest.exists?(employee_id: self.employee_id,current_status: 'Pending') ||
      flag1 = TravelRequest.exists?(employee_id: self.employee_id,current_status: 'FirstApproved') ||
      flag2 = TravelRequest.exists?(employee_id: self.employee_id,current_status: 'SecondApproved') 
    flag
    flag1
    flag2
    
  end
end