class LeaveDetail < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :leav_category

  def self.create_leave_detail_information(salaryslip,elb,leave_count)
  	LeaveDetail.new do |l|
  		l.salaryslip_id = salaryslip.id
  		l.leav_category_id = elb.leav_category_id
  		l.balance = elb.no_of_leave.to_f
  		l.no_of_leave = leave_count.to_f
      l.save
  	end
  end

   def self.filter_records(current_user)
    @leave_details =  if current_user.class == Group
      LeaveDetail.all
    elsif current_user.class == Member
     LeaveDetail.all
    end
  end

end
