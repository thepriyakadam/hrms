class Gratuity < ActiveRecord::Base
  belongs_to :employee
  belongs_to :gratuity_master

	validates :employee_id, presence: true,  uniqueness: { case_sensitive: false }
end
