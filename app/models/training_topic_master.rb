class TrainingTopicMaster < ActiveRecord::Base
validates :name, presence: true,  uniqueness: { case_sensitive: false }
validates :code, uniqueness: { case_sensitive: false }
end
