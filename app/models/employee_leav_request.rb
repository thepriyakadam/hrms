class EmployeeLeavRequest < ActiveRecord::Base
  enum current_status: [:Pending, :Cancelled, :FirstApproved, :FinalApproved, :Rejected, :Rejected]
  belongs_to :employee
  belongs_to :leav_category
  has_one :leav_cancelled
  has_one :leav_approved
  has_one :leav_rejected
  has_many :leave_status_records
  has_many :particular_leave_records

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
      leave_balance.no_of_leave = leave_balance.no_of_leave.to_i - employee_leav_request.leave_count.to_f
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
end