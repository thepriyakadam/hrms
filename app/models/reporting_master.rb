class ReportingMaster < ActiveRecord::Base
  belongs_to :employee
  belongs_to :interview_schedule
  belongs_to :vacancy_master
  has_many :reporting_masters_vacancy_masters
  has_many :vacancy_masters, :through =>:reporting_masters_vacancy_masters
  has_many :training_requests, :through =>:reporting_masters_training_reqs 
  has_many :employee_transfers, :through =>:reporting_employee_transfers
    
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
  
  before_destroy :check_for_employee

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
      
      manager = spreadsheet.cell(i,'B').to_i
      is_active = spreadsheet.cell(i,'C')

      if is_active == "Active" || is_active == "active" || is_active == "Yes" || is_active == "yes"
        is_active = true
      else
        is_active = false
      end

      employee = Employee.find_by(manual_employee_code: manager)
      @reporting_master = ReportingMaster.find_by(employee_id: employee.id )
      if @reporting_master.nil?
        @reporting_master = ReportingMaster.create(employee_id: employee.id,is_active: is_active)     
      else
        @reporting_master.update(employee_id: employee.id,is_active: is_active)
      end
    end#do
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def check_for_orders
    if orders.count > 0
      errors.add_to_base("cannot delete customer while orders exist")
      return false
    end
  end

 end

 