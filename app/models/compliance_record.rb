class ComplianceRecord < ActiveRecord::Base
  belongs_to :compliance_type
  belongs_to :agency
end
