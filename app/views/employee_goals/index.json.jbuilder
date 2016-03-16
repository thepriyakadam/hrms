json.array!(@employee_goals) do |employee_goal|
  json.extract! employee_goal, :id, :appraisee_id, :appraiser_id, :goal_perspective_id, :goal_measure_id, :target, :goal_weightage, :difficulty_level, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating
  json.url employee_goal_url(employee_goal, format: :json)
end
