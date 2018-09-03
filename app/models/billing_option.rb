class BillingOption < ActiveRecord::Base
  belongs_to :expence_opestion
  has_many :expenses_masters
end
