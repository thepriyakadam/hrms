module EmployeeGradesHelper
  def all_employee_grade
    EmployeeGrade.all.collect { |x| [x.name, x.id] }
  end
end
