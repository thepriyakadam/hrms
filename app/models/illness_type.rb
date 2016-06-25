class IllnessType < ActiveRecord::Base
	has_many :employee_nominations

	validates :code, presence: true,  uniqueness: { case_sensitive: false }
    validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
