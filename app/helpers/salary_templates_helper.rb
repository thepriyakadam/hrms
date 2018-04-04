module SalaryTemplatesHelper
  def all_salary_template
    SalaryTemplate.where(is_active: true).collect { |t| [t.code + ' - '+ t.try(:description), t.id] }
  end
end
