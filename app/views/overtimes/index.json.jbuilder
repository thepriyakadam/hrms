json.array!(@overtimes) do |overtime|
  json.extract! overtime, :id, :employee_id, :ot_date, :ot_type, :ot_total_hrs, :total_production, :normal_wages_rate, :ot_wages_rate, :ot_earning, :paid_on_date, :remarks
  json.url overtime_url(overtime, format: :json)
end
