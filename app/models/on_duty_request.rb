class OnDutyRequest < ActiveRecord::Base
  enum current_status: [:Pending, :Cancelled, :FirstApproved, :FinalApproved, :Rejected]
  belongs_to :employee
  has_many :od_records
  has_many :od_status_records
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

  def create_for_particular_od_record(on_duty_request)
    for i in on_duty_request.start_date.to_date..on_duty_request.end_date.to_date
      if on_duty_request.leave_type == 'Full Day'
        ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: true)
      elsif on_duty_request.leave_type == 'Full/Half'
          start_date = on_duty_request.start_date.to_date
          end_date = on_duty_request.end_date.to_date
        if on_duty_request.first_half == true && on_duty_request.last_half == true
          if i == start_date
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
          elsif i == end_date
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
          else
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: true)
          end
        elsif on_duty_request.last_half == true
          if i == start_date
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
          else
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: true)
          end
        elsif on_duty_request.first_half == true
          if i == end_date
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
          else
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: true)
          end
        else
          if i == start_date
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
          else
            ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: true)
          end
        end #@on_duty_request.first_half == true   
      else #leave_type = "Half Day"
        ParticularOdRecord.create(employee_id: on_duty_request.employee_id,on_duty_request_id: on_duty_request.id,leave_date: i,is_full: false)
      end
    end #for i
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
  
  def create_od_in_attendance
    if self.is_present?
    else
        if self.leave_type == "Full Day"
          for i in self.start_date.to_date..self.end_date.to_date
            if self.is_there(i)
            else
            EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
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
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              elsif i == end_date
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end #i==start_date
            elsif self.last_half == true
              if i == start_date
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            elsif self.first_half == true
              if i == end_date
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              else
                if self.is_there(i)
                else
                EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
                end
              end
            else
              if self.is_there(i)
              else
              EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: 'OD', count: 1, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
              end
            end #self.first_half
          end #for i in

        else #FULL DAY
          for i in self.start_date.to_date..self.start_date.to_date
            if self.is_there(i)
            else
            EmployeeAttendance.create(employee_id: self.employee_id, day: i, present: "P/OD", count: 0.5, employee_leav_request_id: self.id,department_id: self.employee.try(:department_id))
            end
          end #for
        end # FULL DAY
      end# 
  end

end
