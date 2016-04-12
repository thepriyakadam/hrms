module SalaryTemplatesHelper
  def all_salary_template
    SalaryTemplate.all.collect { |t| [t.code, t.id] }
  end
end
