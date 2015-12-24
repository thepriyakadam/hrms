class SalaryComponent < ActiveRecord::Base
	scope :deducted, -> { where(is_deducted: true) }
	scope :addected, -> { where(is_deducted: false) }
	validates :name, :code, presence: true, uniqueness: { case_sensitive: false }
	has_many :employee_annual_salaries

	has_many :children, class_name: "SalaryComponent",
                          foreign_key: "parent_id"
  belongs_to :parent, class_name: "SalaryComponent"

end
