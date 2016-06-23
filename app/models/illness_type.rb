class IllnessType < ActiveRecord::Base
	has_many :employee_nominations
end
