class EmployeeMailer < ApplicationMailer
  def birthday_email
    date = Date.today
    @employees = Employee.where("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m')).pluck(:email)
    # @employees.each do |e|
    attachments.inline['bday.jpg'] = File.read("#{Rails.root}/app/assets/images/bday.jpg")
    mail(to: @employees, subject: 'Birthday Wishes')
   # end
  end
 
  def user_confirmation(emp,pwd)
    @password = pwd
    @employee = emp
    @emp = Employee.find_by(id: @employee.id)
    mail(to: @emp.email, subject: 'HRMS Password Details')
  end

  def manager_detail(manager_1,emp)
    @manager_1 = manager_1
    @employee = emp
    @joining_detail = JoiningDetail.find_by(employee_id: @employee.id)
    @emp = Employee.find_by(id: @employee.id)
    @manager = Employee.find_by(id: @manager_1)
    mail(to: @manager.email, subject: 'HRMS Reporting Details')
  end

  def employee_create(employee)
    @emp = Employee.find_by(id: employee.id)
    mail(to: @emp.company_location.email, subject: 'Employee Details')
  end

  def joining_create(employee)
    @emp = Employee.find_by(id: employee.id)
    mail(to: @emp.company_location.email, subject: 'Joining Details')
  end

  def bank_create(employee)
    @emp = Employee.find_by(id: employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Bank Details')
  end

  def qualification_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Qualification Details')
  end

  def experience_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Experience Details')
  end

  def skillset_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Skillset Details')
  end

  def certification_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Certification Details')
  end

  def award_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Award Details')
  end

  def physical_detail_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Physical Details')
  end

  def family_detail_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Family Details')
  end

  def asset_detail_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Asset Details')
  end

  def employee_document_create(employee)
    @employee = employee
    @emp = Employee.find_by(id: @employee.id)
    @location = CompanyLocation.find_by(id: @emp.company_location_id)
    mail(to: @location.email, subject: 'Document Details')
  end
  # def birthday_invitation
  #     date = Date.today 
  #     Employee.where.not("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m')).find_in_batches do |group|
  #       sleep(5)
  #       group.each { |emp| 
  #         mail(to: emp.try(:email), subject: 'Birthday Invitation')  }
  #     end
  #     # attachments.inline['bday.jpg'] = File.read("#{Rails.root}/app/assets/images/bday.jpg")
  # end

  # def birthday_invitation
  #     date = Date.today 
  #     emps=Employee.where.not("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m'))
  #     arr=Array.new
  #     emps[0..3].each do |obj|
  #        arr << obj
  #         mail(to: obj.try(:email), subject: 'Birthday Invitation')
  #     end
  #     # attachments.inline['bday.jpg'] = File.read("#{Rails.root}/app/assets/images/bday.jpg")
  # end

  # def birthday_invitation
  #   date = Date.today 
  #   emps=Employee.where.not("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m'))
  #   emps.find_in_batches(batch_size: 20) do |group|
  #     emails = group.map(&:email)
  #     mail(to: emails, subject: 'Birthday Invitation')
  #     sleep(5)
  # end

  # end


def birthday_invitation
    date = Date.today 
    emps=Employee.where.not("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m'))
    emps.find_in_batches(batch_size: 20) do |group|
      group.each { |emp| mail(to: emp.email, subject: 'Birthday Invitation'); sleep 2;}
      # group.each { |emp| mail(to: emp.email, subject: 'Birthday Invitation')}
      sleep 5
  end
end

# def birthday_email
#   date = Date.today 
#     Employee.where("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m')).where("age > 21").find_in_batches do |group|
#       sleep(5)
#       group.each { |emp| mail(to: emp.email, subject: 'Birthday Wishes')  }
#     end

# end

# private

# def email_images
#     attachments.inline['avatar2.png'] = File.read('app/assets/images/avatar2.png')
# end

end


# arr=Array.new
# objects[0..3].each do |obj|
#     arr << obj
# end

# p arr;