class EmployeeMailer < ApplicationMailer
  def birthday_email
    date = Date.today
    @employees = Employee.where("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m')).pluck(:email)
    # @employees.each do |e|
    attachments.inline['bday.jpg'] = File.read("#{Rails.root}/app/assets/images/bday.jpg")
    mail(to: @employees, subject: 'Birthday Wishes')
   # end
  end

  # def birthday_invitation
  #   date = Date.today
  #   @employees = Employee.where.not("status = ? AND strftime('%d/%m', date_of_birth) = ?", "Active" , date.strftime('%d/%m')).pluck(:email)
  #   # @employees_bday = Employee.where("strftime('%d/%m', date_of_birth) = ?", date.strftime('%d/%m')).pluck(:first_name,:middle_name,:last_name)
  #   # @employees.each do |e|
  #   attachments.inline['bday.jpg'] = File.read("#{Rails.root}/app/assets/images/bday.jpg")
  #   mail(to: @employees, subject: 'Birthday Invitation')
  # end

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