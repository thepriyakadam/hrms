class CompanyLeav < ActiveRecord::Base
  belongs_to :employee_grade
  belongs_to :leav_category


 validates :no_of_leave, :presence => true
  validates :expire_date, :presence => true

  validates_length_of :no_of_leave, is: 20,  message:"No. Of leaves allows upto 20 characters"
  validates_length_of :expire_date, is:100, message:"lease specify Expiry Details for Leave"




end
