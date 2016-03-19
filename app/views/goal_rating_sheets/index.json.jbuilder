json.array!(@goal_rating_sheets) do |goal_rating_sheet|
  json.extract! goal_rating_sheet, :id, :appraisee_id, :appraiser_id, :employee_goal_id, :allign_to_supervisor, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating
  json.url goal_rating_sheet_url(goal_rating_sheet, format: :json)
end
