class AttributeRatingSheetMailer < ApplicationMailer
	def send_email_to_appraiser(attribute_rating_sheet)
    @employee = Employee.find(attribute_rating_sheet.employee_attribute.emp_head)
    @attribute_rating_sheet = AttributeRatingSheet.find(attribute_rating_sheet.id)
    mail(to: @employee.email, subject: 'Self Rating Confirmation')
  end
end
