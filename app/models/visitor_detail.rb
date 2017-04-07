class VisitorDetail < ActiveRecord::Base
  belongs_to :meet_to, class_name: 'Employee'
  belongs_to :authorized_by, class_name: 'Employee'
end
