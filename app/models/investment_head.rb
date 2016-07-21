class InvestmentHead < ActiveRecord::Base
  belongs_to :section
  has_many :investment_declarations
  validates :section_id,presence:true
end
