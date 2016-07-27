class DueAction < ActiveRecord::Base
  belongs_to :due_detail
  belongs_to :due_employee_detail
end
