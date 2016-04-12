class WellFaire < ActiveRecord::Base
  validates :month, :amount, :status, presence: true
end
