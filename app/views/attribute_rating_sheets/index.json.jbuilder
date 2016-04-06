json.array!(@attribute_rating_sheets) do |attribute_rating_sheet|
  json.extract! attribute_rating_sheet, :id, :appraisee_id, :appraiser_id, :employee_attribute_id, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating
  json.url attribute_rating_sheet_url(attribute_rating_sheet, format: :json)
end
