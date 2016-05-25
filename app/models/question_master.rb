class QuestionMaster < ActiveRecord::Base
validates :code, presence: true,  uniqueness: { case_sensitive: false }
 validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
