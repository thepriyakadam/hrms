class LeaveDetail < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :leav_category

  def self.create_leave_detail_information(salaryslip,elb,leave_count)
  	LeaveDetail.new do |l|
  		l.salaryslip_id = salaryslip.id
  		l.leav_category_id = elb.leav_category_id
  		l.balance = elb.no_of_leave
  		l.no_of_leave = leave_count
      l.save
  	end
  end

end
