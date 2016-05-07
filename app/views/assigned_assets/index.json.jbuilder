json.array!(@assigned_assets) do |assigned_asset|
  json.extract! assigned_asset, :id, :employee_id, :asset_type_id, :assets_detail, :assets_id, :assets_value, :assest_status, :issue_date, :valid_till, :returned_on, :remarks
  json.url assigned_asset_url(assigned_asset, format: :json)
end
