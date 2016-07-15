json.array!(@investment_declarations) do |investment_declaration|
  json.extract! investment_declaration, :id, :date, :investment_head_id, :amount, :employee_id, :status
  json.url investment_declaration_url(investment_declaration, format: :json)
end
