json.extract! membership_contribution, :id, :membership_id, :date, :amount, :created_at, :updated_at
json.url membership_contribution_url(membership_contribution, format: :json)
