class BillingOption < ActiveRecord::Base
  belongs_to :expence_opestion
  has_many :expenses_masters
  has_many :daily_bill_details
end
