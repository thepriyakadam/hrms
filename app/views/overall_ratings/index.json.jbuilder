json.array!(@overall_ratings) do |overall_rating|
  json.extract! overall_rating, :id, :goal_rating_sheet_id, :employee_id, :ro1_id, :ro2_id, :final_id, :ro1_rating_id, :ro1_comment, :ro2_rating_id, :ro2_comment, :final_rating_id, :final_comment, :promotion, :increment, :final_ctc, :appraisee_comment
  json.url overall_rating_url(overall_rating, format: :json)
end
