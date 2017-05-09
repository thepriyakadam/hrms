class JoiningChecklistMaster < ActiveRecord::Base
	has_many :employee_jc_lists

  validates :code, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
