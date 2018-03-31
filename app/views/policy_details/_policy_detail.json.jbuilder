json.extract! policy_detail, :id, :investment_declaration_id, :insurer, :policy_no, :relation, :frequency, :premium_amount, :estimated_annual_amount, :actual_annual_amount, :created_at, :updated_at
json.url policy_detail_url(policy_detail, format: :json)
