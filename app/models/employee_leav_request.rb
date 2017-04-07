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
  has_many :leave_records

  belongs_to :first_reporter, class_name: 'Employee'
  belongs_to :second_reporter, class_name: 'Employee'

  #validates :date_range, uniqueness: { scope: [:date_range, :employee_id] }

  # CURRENT_STATUSS = [["Pending",0], ["FirstApproved",2], ["SecondApproved",3], ["FirstRejected",4],["SecondRejected",5],["Cancelled",1]]
  # validates_inclusion_of :current_status, :in => CURRENT_STATUSS

  def is_salary_processed?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = Workingday.exists?(year: i.year,month_name: i.strftime("%B"), employee_id: self.employee_id)
    end
    flag
  end

  def create_single_record_for_leave(employee_leav_request)
    if employee_leav_request.leave_type == 'Full Day'
      for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date
        employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
        EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code),employee_leav_request_id: employee_leav_request.id,count: 1)
      end

    elsif employee_leav_request.leave_type == 'Full/Half'
      for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date
          start_date = employee_leav_request.start_date.to_date
          end_date = employee_leav_request.end_date.to_date
        if employee_leav_request.first_half == true && employee_leav_request.last_half == true
          if i == start_date
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
            if employee_leav_request.present_status == false
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "A/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            else
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "P/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            end
          elsif i == end_date
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
            if employee_leav_request.present_status == false
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/A",employee_leav_request_id: employee_leav_request.id,count: 0.5)
            else
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/P",employee_leav_request_id: employee_leav_request.id,count: 0.5)
            end
          else
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code),employee_leav_request_id: employee_leav_request.id,count: 1)
          end 
        elsif employee_leav_request.last_half == true
          if i == start_date
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
            if employee_leav_request.present_status == false
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "A/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            else
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "P/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            end
          else
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code),employee_leav_request_id: employee_leav_request.id,count: 1)
          end
        elsif employee_leav_request.first_half == true
          if i == end_date
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
            if employee_leav_request.present_status == false
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/A",employee_leav_request_id: employee_leav_request.id,count: 0.5)
            else
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/P",employee_leav_request_id: employee_leav_request.id,count: 0.5)
            end
          else
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code),employee_leav_request_id: employee_leav_request.id,count: 1)
          end
        else
          if i == start_date
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
            if employee_leav_request.present_status == false
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "A/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            else
              EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "P/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
            end
          else
            employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: true, leav_category_id: employee_leav_request.leav_category_id)
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code),employee_leav_request_id: employee_leav_request.id,count: 1)
          end
        end
      end
    else#HALF DAY 

      for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date    
        if employee_leav_request.first_half == true
          employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
          if employee_leav_request.present_status == false
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/A",employee_leav_request_id: employee_leav_request.id,count: 0.5)
          else
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: employee_leav_request.try(:leav_category).try(:code).to_s+"/P",employee_leav_request_id: employee_leav_request.id,count: 0.5)
          end
        else 
          employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leave_date: i, is_full: false, leav_category_id: employee_leav_request.leav_category_id)
          if employee_leav_request.present_status == false
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "A/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
          else
            EmployeeAttendance.where(employee_id: employee_leav_request.employee_id,day: i).update_all(present: "P/"+employee_leav_request.try(:leav_category).try(:code).to_s,employee_leav_request_id: employee_leav_request.id,count: 0.5)
          end
        end#first_half
      end#for
    end
  end

  def minus_leave(employee_leav_request)
    leave_balance = EmployeeLeavBalance.where("employee_id = ? AND leav_category_id = ? AND is_active = ?",employee_leav_request.employee_id, employee_leav_request.leav_category_id, true).take
    unless leave_balance.nil?
      leave_balance.no_of_leave.to_f
      employee_leav_request.leave_count.to_f
      leave_balance.no_of_leave = leave_balance.no_of_leave.to_f - employee_leav_request.leave_count.to_f
      #leave_balance.no_of_leave = leave_balance.no_of_leave.to_f - employee_leav_request.leave_count.to_f
      leave_balance.save
    end
  end

  def revert_leave(employee_leav_request)
    leave_balance = EmployeeLeavBalance.where("employee_id = ? AND leav_category_id = ? AND is_active = ?",employee_leav_request.employee_id, employee_leav_request.leav_category_id, true).take

    unless leave_balance.nil?
      leave_balance.no_of_leave = leave_balance.no_of_leave.to_f + employee_leav_request.leave_count.to_f
      leave_balance.save
    end
  end

  def manage_coff(request)
    if request.leav_category.name == 'Compensatory Off'
      c_offs = LeaveCOff.where(employee_id: request.employee_id, is_taken: false, is_expire: nil).order('c_off_date asc')
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
              #c.is_taken = true
              c.save
              c.update(is_taken: true)
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
    end #do
  end

  def self.filter_records(current_user)
    @employee_leave_requests =  if current_user.class == Group
      EmployeeLeavRequest.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        EmployeeLeavRequest.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        EmployeeLeavRequest.where(employee_id: @employees)  
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        EmployeeLeavRequest.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        EmployeeLeavRequest.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        EmployeeLeavRequest.where(employee_id: current_user.employee_id)
      end
    end
  end

  def is_present?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = EmployeeAttendance.exists?(day: i, employee_id: self.employee_id)
    end
    flag
  end

  def is_there(i)
    flag = 0
    flag = EmployeeAttendance.exists?(day: i,employee_id: self.employee_id)
    flag
  end

  def create_attendance
    if self.is_present?
    else
        if self.leave_type == "Full Day"
          for i in self.start_date.to_date..self.end_date.to_date
            if self.is_there(i)
            else
            EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
            end
          end

        elsif self.leave_type == "Full/Half"
          for i in self.start_date.to_date..self.end_date.to_date
            start_date = self.start_date.to_date
            end_date = self.end_date.to_date
            if self.first_half == true && self.last_half == true
              if i == start_date
                if self.is_there(i)
                else
                  if self.present_status == false
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "A/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  else
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  end
                end
              elsif i == end_date
                if self.is_there(i)
                else
                  if self.present_status == false
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/A", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  else
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/P", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  end
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end #i==start_date
            elsif self.last_half == true
              if i == start_date
                if self.is_there(i)
                else
                  if self.present_status == false
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "A/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  else
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  end
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            elsif self.first_half == true
              if i == end_date
                if self.is_there(i)
                else
                  if self.present_status == false
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/A", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  else
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/P", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  end
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            else
              if i == start_date
                if self.is_there(i)
                else
                  if self.present_status == false
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "A/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  else
                    EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                  end
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s, count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            end #self.first_half
          end #for i in

        else #HALF DAY
          for i in self.start_date.to_date..self.start_date.to_date
            if self.first_half == true
              if self.is_there(i)
              else
                if self.present_status == false
                  EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/A", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                else
                  EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: self.leav_category.code.to_s+"/P", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            else
              if self.is_there(i)
              else
                if self.present_status == false
                  EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "A/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                else
                  EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/"+self.leav_category.code.to_s, count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            end#first_half
          end#for
        end#FULL,HALF
    end #self.is_present
  end #def

  def is_holiday?
    flag = 0
    for i in self.start_date.to_date..self.end_date.to_date
      flag = Holiday.exists?(holiday_date: i)
    end
    flag
  end

  def is_available?
    flag = false
    leave_records = LeaveRecord.where(employee_id: self.employee_id,status: 'Pending')
    leave_records.each do |l|
      for i in self.start_date.to_date..self.end_date.to_date
        if i ==  l.day
          flag = true
        end
      end
    end
    flag
  end

  def is_first_approved?
    flag = false
    leave_records = LeaveRecord.where(employee_id: self.employee_id,status: 'FirstApproved')
    leave_records.each do |l|
      for i in self.start_date.to_date..self.end_date.to_date
        if i ==  l.day
          flag = true
        end
      end
    end
    flag
  end

  def is_final_approved?
    flag = false
    leave_records = LeaveRecord.where(employee_id: self.employee_id,status: 'FinalApproved')
    leave_records.each do |l|
      for i in self.start_date.to_date..self.end_date.to_date
        if i ==  l.day
          flag = true
        end
      end
    end
    flag
  end

  def is_continue?
    flag = false
    date = self.start_date
    @date = date.yesterday
    leav_category = LeavCategory.find_by(id: self.leav_category_id)
    @leave_category = EmployeeLeavRequest.where(end_date: @date,employee_id: self.employee_id).pluck(:leav_category_id)
    
    if leav_category.is_continuous == true
      if @leave_category.inject{|n| n} != self.leav_category_id
        flag = EmployeeLeavRequest.exists?(end_date: @date,employee_id: self.employee_id)
      end
    end
    flag
  end
  
  def leave_count?
    count_1 = 0
    count_2 = 0
    start_month = self.start_date.strftime("%B")
    end_month = self.end_date.strftime("%B")
    for i in self.start_date.to_datetime..self.end_date.to_datetime
      if start_month == end_month
        count = ParticularLeaveRecord.where("employee_id = ? AND DATE_FORMAT('%m/%Y', leave_date) = ? AND leav_category_id = ?" ,  self.employee_id,i.strftime('%m/%y'),self.leav_category_id)
        count_1 = count_1 + 1
      else
        count = ParticularLeaveRecord.where("employee_id = ? AND DATE_FORMAT('%m/%Y', leave_date) = ? AND leav_category_id = ?" ,  self.employee_id,i.strftime('%m/%y'),self.leav_category_id)
        count_2 = count_2 + 1
      end
    end
    count_1
    count_2

    @leave_category = LeavCategory.find_by(id: self.leav_category_id)
    @monthly_limit = @leave_category.monthly_leave
    
    if count_1 > @monthly_limit
    elsif count_2 > @monthly_limit
    end
  end

  def leave_record_create(employee_leav_request)
    for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date 
      start_date = employee_leav_request.start_date.to_date
      end_date = employee_leav_request.end_date.to_date
      if employee_leav_request.leave_type == 'Full Day'
        LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 1,leav_category_id: employee_leav_request.leav_category_id)
      elsif employee_leav_request.leave_type == 'Full/Half'
        if employee_leav_request.first_half == true && employee_leav_request.last_half == true
          if i == start_date
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
          elsif i == end_date
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
          else
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 1,leav_category_id: employee_leav_request.leav_category_id)
          end
        elsif employee_leav_request.last_half == true
          if i == start_date
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
          else
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 1,leav_category_id: employee_leav_request.leav_category_id)
          end
        elsif employee_leav_request.first_half == true
          if i == end_date
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
          else
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 1,leav_category_id: employee_leav_request.leav_category_id)
          end
        else
          if i == start_date
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
          else
            LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 1,leav_category_id: employee_leav_request.leav_category_id)
          end
        end
      else
        LeaveRecord.create(employee_id: employee_leav_request.employee_id,employee_leav_request_id: employee_leav_request.id,status: "Pending", day: i,count: 0.5,leav_category_id: employee_leav_request.leav_category_id)
      end
    end
  end

  def leave_monthly_limit(employee_leav_request)
    @leav_category = LeavCategory.find_by(id: self.leav_category_id)
    
      for i in self.start_date.to_datetime..self.end_date.to_datetime
        start_month = self.start_date.strftime("%B")
        end_month = self.end_date.strftime("%B")
        if start_month == end_month
          @lr = LeaveRecord.where("employee_id = ? AND DATE_FORMAT('%m/%Y', day) = ? AND leav_category_id = ?" ,  self.employee_id,i.strftime('%m/%Y'),self.leav_category_id).where.not(status: 'Cancelled').where.not(status: 'Rejected')
          a = 0
          @lr.each do |l|
            a = a + l.count
          end#do
            @month_same = a.to_f + employee_leav_request.leave_count.to_f
        
        else #month
          @start_date = start_date.to_datetime
          @end_date = end_date.to_datetime
            elr_1 = 0
            elr_2 = 0

          for d in @start_date..@end_date 
            if d.strftime('%m/%Y') == @start_date.strftime('%m/%Y')
              elr_1 = elr_1 + 1
            else d.strftime('%m/%Y') == @end_date.strftime('%m/%Y')
              elr_2 = elr_2 + 1
            end
          end
              elr_1
              elr_2

          @lr_1 = LeaveRecord.where("employee_id = ? AND DATE_FORMAT('%m/%Y', day) = ? AND leav_category_id = ?" ,  self.employee_id,@start_date.strftime('%m/%Y'),self.leav_category_id).where.not(status: 'Cancelled').where.not(status: 'Rejected')
          a = 0
          @lr_1.each do |l|
            a = a + l.count
          end#do
           @count1 = a.to_f + elr_1.to_f

          @lr_2 = LeaveRecord.where("employee_id = ? AND DATE_FORMAT('%m/%Y', day) = ? AND leav_category_id = ?" ,  self.employee_id,@end_date.strftime('%m/%Y'),self.leav_category_id).where.not(status: 'Cancelled').where.not(status: 'Rejected')
          b = 0
          @lr_2.each do |l|
            b = b + l.count
          end#do
           @count2 = b.to_f + elr_2.to_f
           
          main = @count1.to_f <= @leav_category.monthly_leave.to_f && @count2.to_f <= @leav_category.monthly_leave.to_f
            if main == true
              @month_diff1 = @leav_category.monthly_leave.to_f
            else
              @month_diff2 = @leav_category.monthly_leave.to_f + 2
            end#main == true
        end #month
      end #for
        if start_month == end_month
          @month_same
        else
          @month_diff1 || @month_diff2
        end
  end #def

end