class EmployeeShift < ActiveRecord::Base
  belongs_to :company_shift
  belongs_to :employee
<<<<<<< HEAD

  validates :company_shift_id, :presence => true
  validates :from_date, :presence => true
  validates :to_date, :presence => true



=======
>>>>>>> c36f0bc6633b1be9b24b36aa12152d3a6b671b2f
end
