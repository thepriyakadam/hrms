class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_one :member, as: :account
  after_create :create_user_account

  def create_user_account
    employee = Employee.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = employee
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Employee Account created successfully."
      #UserPasswordMailer.welcome_email(employee,pass).deliver_now
    end
  end
end
