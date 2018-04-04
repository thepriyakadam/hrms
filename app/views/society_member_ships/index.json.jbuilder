json.array!(@society_member_ships) do |society_member_ship|
  json.extract! society_member_ship, :id, :is_society_member, :amount, :employee_id
  json.url society_member_ship_url(society_member_ship, format: :json)
end
