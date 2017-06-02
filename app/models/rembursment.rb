class Rembursment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  belongs_to :rembursmentmaster

  has_many :reporting_master_rembursments

   validates :employee_id, presence: true
   validates :rembursment_date, presence: true
   validates :amount, presence: true
   validates :rembursmentmaster, presence: true
end
