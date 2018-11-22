class TopicComment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :topic
end
