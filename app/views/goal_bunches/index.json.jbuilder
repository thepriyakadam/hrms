json.array!(@goal_bunches) do |goal_bunch|
  json.extract! goal_bunch, :id, :period_id, :employee_id, :appraisee_id, :appraisee_comment, :appraisee_confirm, :appraiser_id, :appraiser_rating, :appraiser_comment, :appraiser_confirm, :reviewer_id, :reviewer_comment_id, :reviewer_rating_id, :reviewer_confirm, :final_id, :final_comment, :final_rating_id, :final_confirm
  json.url goal_bunch_url(goal_bunch, format: :json)
end
