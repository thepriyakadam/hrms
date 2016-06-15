class SalaryMapSap < ActiveRecord::Base
  belongs_to :salary_component
validates :salary_component_id,presence:true
validates :account_code,presence:true
end
