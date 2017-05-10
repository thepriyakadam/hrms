class DueAction < ActiveRecord::Base
  belongs_to :due_detail
  belongs_to :due_employee_detail


  def is_exist(due_employee_detail)
  	# byebug
  	flag = 0
    DueAction.exists?(is_confirm: true,due_employee_detail_id: due_employee_detail)
    flag
  end

end
