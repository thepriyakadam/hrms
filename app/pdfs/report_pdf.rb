class ReportPdf < Prawn::Document
  def initialize(interview_schedules)
    super()
    @interview_schedules = interview_schedules

    table_content
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table interview_schedule_rows, width: 550

    font_style = :bold
  end

  def interview_schedule_rows
    [['#', 'Interviewer Name', 'Email ID', 'Candidate Name']] +
      @interview_schedules.map do |interview_schedule|
        [interview_schedule.id, interview_schedule.interviewer_name, interview_schedule.email_id, interview_schedule.candidate_name]
    end
  end

  def initialize(employees)
    super()
    @employees = employees
    table_content
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table employee_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['FFFFFF']
      self.column_widths = [50, 200, 100, 100, 90]
    end
 end

  def employee_rows
    [['Code', 'Employee Name', 'Designation', 'Employment', 'Contact']] +
      @employees.map do |employee|
        [employee.manual_employee_code, employee.first_name.to_s + ' ' + employee.middle_name.to_s + ' ' + employee.last_name.to_s, employee.joining_detail.try(:employee_designation).try(:name), employee.employee_type.try(:name), employee.try(:contact_no)]
      end
end
end
