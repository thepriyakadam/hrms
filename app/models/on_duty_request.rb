class OnDutyRequest < ActiveRecord::Base
  enum current_status: [:Pending, :Cancelled, :FirstApproved, :FinalApproved, :Rejected]
  belongs_to :employee
  has_many :od_records
  has_many :od_status_records
  has_many :particular_od_records
  belongs_to :first_reporter, class_name: 'Employee'
  belongs_to :second_reporter, class_name: 'Employee'

  def is_available?
    flag = false
    od_records = OdRecord.where(employee_id: self.employee_id).where.not(status: 'Rejected').where.not(status: 'Cancelled')
    od_records.each do |l|
      for i in self.start_date.to_date..self.end_date.to_date
        if i ==  l.day
          flag = true
        end
      end
    end
    flag
  end

  def create_od_in_attendance
    flag = 0
    flag1 = 0
    for i in self.start_date.to_date..self.end_date.to_date
      start_date = self.start_date.to_date
      end_date = self.end_date.to_date
        flag = EmployeeAttendance.exists?(day: i,employee_id: self.employee_id)
      if flag == true
          flag1 = EmployeeAttendance.exists?(day: i,employee_id: self.employee_id,employee_leav_request_id: nil)
        if flag1 == true
            @emp_attendance = EmployeeAttendance.where(day: i,employee_id: self.employee_id).take
            if self.leave_type == "Full Day"
              @emp_attendance.update(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
            elsif self.leave_type == "Full/Half"
              if self.first_half == true && self.last_half == true
                if i == start_date
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                elsif i == end_date
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                else
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: "OD", count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                end
              elsif self.last_half == true
                if i == start_date
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                else
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                end
              elsif self.first_half == true
                if i == end_date
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                else
                  @emp_attendance.update(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
                end
              else
                @emp_attendance.update(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              end #self.first_half == true && self.last_half == true
            else #self.leave_type == "Full Day"
              @emp_attendance.update(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
            end #self.leave_type == "Full Day"
        else #flag1
          if self.leave_type == "Full Day"
            ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true,is_cancel_after_approve: true)
            elsif self.leave_type == "Full/Half"
              if self.first_half == true && self.last_half == true
                if i == start_date
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false,is_cancel_after_approve: true)
                elsif i == end_date
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false,is_cancel_after_approve: true)
                else
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true,is_cancel_after_approve: true)
                end
              elsif self.last_half == true
                if i == start_date
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false,is_cancel_after_approve: true)
                else
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true,is_cancel_after_approve: true)
                end
              elsif self.first_half == true
                if i == end_date
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false,is_cancel_after_approve: true)
                else
                  ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true,is_cancel_after_approve: true)
                end
              else
                ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true,is_cancel_after_approve: true)
              end #self.first_half == true && self.last_half == true
            else #self.leave_type == "Full Day"
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false,is_cancel_after_approve: true)
            end #self.leave_type == "Full Day"
        end #flag1

      else #flag

        if self.leave_type == "Full Day"
          EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
          ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true)
        elsif self.leave_type == "Full/Half"
          if self.first_half == true && self.last_half == true
            if i == start_date
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false)
            elsif i == end_date
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false)
            else
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true)
            end #i==start_date
          elsif self.last_half == true
            if i == start_date
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false)
            else
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true)
            end
          elsif self.first_half == true
            if i == end_date
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false)
            else
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
              ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true)
            end
          else
            EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
            ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: true)
          end #self.first_half
        else #FULL DAY
          for i in self.start_date.to_date..self.start_date.to_date
            EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5,department_id: self.employee.try(:department_id),on_duty_request_id: self.id)
            ParticularOdRecord.create(employee_id: self.employee_id,on_duty_request_id: self.id,leave_date: i,is_full: false)
          end #for
        end # FULL DAY
      end #flag
    end#for i in 
  end #def

end
