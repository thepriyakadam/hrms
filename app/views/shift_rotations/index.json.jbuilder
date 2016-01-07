json.array!(@shift_rotations) do |shift_rotation|
  json.extract! shift_rotation, :id, :company_shift_id, :start_date, :end_date
  json.url shift_rotation_url(shift_rotation, format: :json)
end
