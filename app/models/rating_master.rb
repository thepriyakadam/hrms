class RatingMaster < ActiveRecord::Base
	has_many :appraisee_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraisee_rating_id"

  has_many :appraiser_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraiser_rating_id"

  has_many :appraiser2_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraiser2_rating_id"

  has_many :final_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "final_rating_id"


  has_many :appraisee_rating_attribute_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraisee_rating_id"

  has_many :appraiser_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraiser_rating_id"

  has_many :appraiser2_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "appraiser2_rating_id"

  has_many :final_rating_goal_rating_sheets, class_name: "RatingMaster",
                          foreign_key: "final_rating_id"
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
