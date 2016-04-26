json.array!(@daily_bill_details) do |daily_bill_detail|
  json.extract! daily_bill_detail, :id, :travel_request_id, :expence_date, :e_place, :travel_expence, :local_travel_expence, :lodging_expence, :boarding_expence, :other_expence
  json.url daily_bill_detail_url(daily_bill_detail, format: :json)
end
