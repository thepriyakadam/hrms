class EmployeeLeavRequestReport
  include Datagrid

  scope do
    EmployeeLeavRequest
  end
  # filter(:id, :integer, :range => true)
  # filter(:manual_employee_code, :string)
  filter(:start_date, :date, range: true)
  # filter(:end_date, :date, :range => true)
  # filter(:no_of_day, :integer, :range => true)
  # filter(:condition, :dynamic, :header => "Dynamic condition")
  # filter(:current_status, :enum, :select => EmployeeLeavRequest::CURRENT_STATUSS.map {|r| [r.humanize, r]})
  filter(:current_status, :enum, select: [['Pending', 0], ['FirstApproved', 2], ['SecondApproved', 3], ['FirstRejected', 4], ['SecondRejected', 5], ['Cancelled', 1]])

  #
  # Columns
  #
  # column(:id, :mandatory => true)
  column(:employee_id, mandatory: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
  column(:employee_id, mandatory: true) { |employee_leav_request| employee_leav_request.employee.try(:first_name) }
  column(:employee_id, mandatory: true) { |employee_leav_request| employee_leav_request.employee.try(:last_name) }
  column(:id, mandatory: true)
  column(:employee_id, mandatory: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
  column(:start_date, mandatory: true) { |employee_leav_request| employee_leav_request.start_date.to_date }
  column(:end_date, mandatory: true) { |employee_leav_request| employee_leav_request.end_date.to_date }
  column(:no_of_day, mandatory: true)
  column(:current_status, mandatory: true)
end
