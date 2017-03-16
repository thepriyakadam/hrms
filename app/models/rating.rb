class Rating < ActiveRecord::Base
	validates :value, presence: true,uniqueness: { case_sensitive: false }

	has_many :goal_ratings, class_name: "Rating",
                          foreign_key: "appraisee_rating_id"

  	has_many :goal_ratings, class_name: "Rating",
                          foreign_key: "appraiser_rating_id"

    has_many :goal_bunches, class_name: "Rating",
                          foreign_key: "reviewer_rating_id"

  	has_many :goal_bunches, class_name: "Rating",
                          foreign_key: "final_rating_id"
end
