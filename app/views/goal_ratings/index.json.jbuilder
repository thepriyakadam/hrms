json.array!(@goal_ratings) do |goal_rating|
  json.extract! goal_rating, :id, :goal_bunch_id, :goal_perspective_id, :goal_weightage, :goal_measure, :target, :aligned, :goal_setter_id, :appraisee_id, :appraisee_comment, :appraiser_id, :appraiser_comment, :appraiser_rating_id, :reviewer_id, :reviewer_comment
  json.url goal_rating_url(goal_rating, format: :json)
end
