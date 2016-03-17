json.array!(@employee_attributes) do |employee_attribute|
  json.extract! employee_attribute, :id, :appraisee_id, :appraiser_id, :attribute_master_id, :definition_id, :weightage, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating
  json.url employee_attribute_url(employee_attribute, format: :json)
end
