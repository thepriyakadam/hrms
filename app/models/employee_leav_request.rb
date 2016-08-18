class EmployeeLeavRequest < ActiveRecord::Base
  enum current_status: [:Pending, :Cancelled, :FirstApproved, :FinalApproved, :Rejected]
  belongs_to :employee
  belongs_to :leav_category
  has_one :leav_cancelled
  has_one :leav_approved
  has_one :leav_rejected
  has_many :leave_status_records
  has_many :particular_leave_records
  has_many :employee_attendances

  belongs_to :first_reporter, class_name: 'Employee'
  belongs_to :second_reporter, class_name: 'Employee'

  # CURRENT_STATUSS = [["Pending",0], ["FirstApproved",2], ["SecondApproved",3], ["FirstRejected",4],["SecondRejected",5],["Cancelled",1]]
  # validates_inclusion_of :current_status, :in => CURRENT_STATUSS

  def create_single_record_for_leave(employee_leav_request)
    if employee_leav_request.leave_type == 'Full Day'
      for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date
        employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
      end
    else
      employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: employee_leav_request.start_date, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
    end
  end

  def minus_leave(employee_leav_request)
    leave_balance = EmployeeLeavBalance.where(employee_id: employee_leav_request.employee_id, leav_category_id: employee_leav_request.leav_category_id).take
    unless leave_balance.nil?
      leave_balance.no_of_leave.to_f
      employee_leav_request.leave_count.to_f
      leave_balance.no_of_leave = leave_balance.no_of_leave.to_f - employee_leav_request.leave_count.to_f
      #leave_balance.no_of_leave = leave_balance.no_of_leave.to_f - employee_leav_request.leave_count.to_f
      leave_balance.save
    end
  end

  def revert_leave(employee_leav_request)
    leave_balance = EmployeeLeavBalance.where(employee_id: employee_leav_request.employee_id, leav_category_id: employee_leav_request.leav_category_id).take
    unless leave_balance.nil?
      leave_balance.no_of_leave = leave_balance.no_of_leave.to_f + employee_leav_request.leave_count.to_f
      leave_balance.save
    end
  end

  def manage_coff(request)
    if request.leav_category.name == 'C.Off'
      c_offs = LeaveCOff.where(employee_id: request.employee_id, is_taken: false).order('c_off_date asc')
      c_offs.each do |c|
        if request.leave_count == 0
        elsif request.leave_count == 0.5
          request.leave_count = request.leave_count - 0.5
          c.leave_count = c.leave_count - 0.5
          c.save
          if c.leave_count == 0
            c.update(is_taken: true)
          end
        else
          if c.c_off_type == 'Full Day'
            if c.leave_count == 0.5
              request.leave_count = request.leave_count - 0.5
              c.leave_count = c.leave_count - 0.5
              c.is_taken = true
              c.save
            else
              request.leave_count = request.leave_count - 1
              c.leave_count = c.leave_count - 1
              c.save
              if c.leave_count == 0
                c.update(is_taken: true)
              end
            end
          else
            request.leave_count = request.leave_count - 0.5
            c.leave_count = c.leave_count - 0.5
            c.save
            if c.leave_count == 0
              c.update(is_taken: true)
            end
          end
        end
      end
    end
  end

  def self.filter_records(current_user)
    @employee_leave_requests =  if current_user.class == Group
                                  EmployeeLeavRequest.all
                                elsif current_user.class == Member
                                  if current_user.role.name == "Company"
                                    @employees = Employee.where(company_id: current_user.company_id)
                                    EmployeeLeavRequest.where(employee_id: @employees)
                                  elsif current_user.role.name == "CompanyLocation"
                                    @employees = Employee.where(company_location_id: current_user.company_location_id)
                                    EmployeeLeavRequest.where(employee_id: @employees)  
                                  elsif current_user.role.name == "Department"
                                    @employees = Employee.where(department_id: current_user.department_id)
                                    EmployeeLeavRequest.where(employee_id: @employees)
                                  elsif current_user.role.name == "Employee"
                                    EmployeeLeavRequest.where(employee_id: current_user.employee_id)
                                  end
                                end
  end

  def create_attendance
    if self.leav_category.is_payble
      if self.leave_type == "Full Day"
        for i in self.start_date.to_date..self.end_date.to_date
          EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.name.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
        end
      else
        for i in self.start_date.to_date..self.start_date.to_date
          EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.name.to_s+"HD", count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
        end
      end
    else
      if self.leave_type == "Full Day"
        for i in self.start_date.to_date..self.end_date.to_date
          EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.name.to_s, count: 0, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
        end
      else
        for i in self.start_date.to_date..self.start_date.to_date
          EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.name.to_s+"HD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
        end
      end
    end
  end

  def is_holiday?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = Holiday.exists?(holiday_date: i)
    end
    flag
  end

  def is_present?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = EmployeeAttendance.exists?(day: i, employee_id: self.employee_id)
    end
    flag
  end

  def is_available?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = EmployeeLeavRequest.exists?(start_date: i, employee_id: self.employee_id)
    end
    flag
  end
end