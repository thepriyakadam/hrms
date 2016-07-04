class CurrencyMaster < ActiveRecord::Base
   has_many :daily_bill_details
end
