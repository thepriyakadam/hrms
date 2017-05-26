class InvestmentDeclaration < ActiveRecord::Base
  belongs_to :investment_head
  belongs_to :employee

  has_attached_file :document,
  :path => "attachments/attach_investment_declarations/:basename.:extension"

  validates_attachment_size :document, less_than: 2.megabytes
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates :investment_head_id, presence: true
  validates :employee_id, presence: true
  validates :amount, presence: true
  validates :date, presence: true
end
