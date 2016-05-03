class ParticularLeaveRecord < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_leav_request
  belongs_to :leav_category

  def rollback_coff(request)
    if request.employee_leav_request.leave_count == 0.5
      is_not_taken = LeaveCOff.where(employee_id: request.employee_id,c_off_type: 'Full Type', is_taken: false).order('c_off_date asc').take
      unless is_not_taken.nil?
        if is_not_taken.leave_count == 0.5
          is_not_taken.leave_count = is_not_taken.leave_count + 0.5
          is_not_taken.save
          request.is_cancel_after_approve = true
        end
      else
        is_taken = LeaveCOff.where(employee_id: request.employee_id, is_taken: false).order('c_off_date desc').take
        unless is_taken.nil?
          if is_taken.c_off_type == "Full Type"
            is_taken.leave_count = is_taken.leave_count + 0.5
          else
            is_taken.leave_count = is_taken.leave_count + 0.5
            is_taken.is_taken = false
          end
          is_taken.save
          request.is_cancel_after_approve = true
        end
      end
    else
      ## leave is greater than 1
      is_not_taken = LeaveCOff.where(employee_id: request.employee_id,c_off_type: 'Full Type', is_taken: false).order('c_off_date asc').take
      unless is_not_taken.nil?
        if is_not_taken.leave_count == 0.5
          is_not_taken.leave_count = is_not_taken.leave_count + 0.5
          is_not_taken.save
          request.is_cancel_after_approve = true
        end
      else
        is_takens = LeaveCOff.where(employee_id: request.employee_id, is_taken: false).order('c_off_date desc').limit(2)
        if is_takens.empty? || is_takens.nil?
        else
          is_takens.each do |t|
            if t.c_off_type == "Full Type"
              t.leave_count = t.leave_count + 1
              t.is_taken = false
              break
            else
              t.leave_count = t.leave_count + 0.5
              t.is_taken = false
            end
            t.save
            request.is_cancel_after_approve = true
          end
        end
      end
    end
    request.save
  end
end
