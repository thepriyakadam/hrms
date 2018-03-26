class ManagerHistory < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager, class_name: 'Employee'
  belongs_to :manager_2, class_name: 'Employee'
end
