class EmployeeJcList < ActiveRecord::Base
  belongs_to :joining_checklist_master
  belongs_to :employee
  belongs_to :admin, class_name: 'Employee'
end