class Like < ActiveRecord::Base
  belongs_to :employee
  belongs_to :topic
  belongs_to :topic_comment
end
