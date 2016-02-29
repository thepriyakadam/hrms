json.array!(@professional_taxes) do |professional_tax|
  json.extract! professional_tax, :id, :is_pt, :min_salary, :max_salary, :pt_amount, :for_months, :march_month
  json.url professional_tax_url(professional_tax, format: :json)
end
