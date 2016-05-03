json.array!(@particular_vacancy_requests) do |particular_vacancy_request|
  json.extract! particular_vacancy_request, :id, :vacancy_master_id, :employee_id, :open_date, :closed_date, :fulfillment_date, :status
  json.url particular_vacancy_request_url(particular_vacancy_request, format: :json)
end
