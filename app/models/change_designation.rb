class ChangeDesignation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_designation
  belongs_to :change_by
end
