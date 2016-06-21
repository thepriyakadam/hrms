class OverallRating < ActiveRecord::Base
  belongs_to :goal_rating_sheet
  belongs_to :employee
  belongs_to :ro1
  belongs_to :ro2
  belongs_to :final
  belongs_to :ro1_rating
  belongs_to :ro2_rating
  belongs_to :final_rating
end
