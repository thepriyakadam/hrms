class ReportingMaster < ActiveRecord::Base
  belongs_to :employee
  belongs_to :interview_schedule
  has_many :reporting_masters_vacancy_masters
  has_many :vacancy_masters, :through =>:reporting_masters_vacancy_masters
  has_many :training_requests, :through =>:reporting_masters_training_reqs  
  has_many :travel_requests
  has_many :training_requests
  has_many :vacancy_request_histories
  has_many :daily_bill_details
  has_many :reward_pals
  has_many :rewards_allocations
  has_many :due_details
  has_many :employee_transfers
  has_many :due_employee_details
  has_many :employee_resignations
  has_many :resignation_histories

 # belongs_to :manager_2, class_name: 'Employee'
 # belongs_to :manager, class_name: 'Employee'

  belongs_to :reporting_master, class_name: 'Employee'
  validates :employee_id, presence: true, uniqueness: { case_sensitive: false }
 end

 