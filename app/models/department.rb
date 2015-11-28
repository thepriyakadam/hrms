class Department < ActiveRecord::Base
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_one :member, as: :account
  after_create :create_user_account


  validates :name, :presence => true

  def create_user_account
    department = Department.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = department
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Department Account created successfully."
      #UserPasswordMailer.welcome_email(department,pass).deliver_now
    end
    p user.errors
  end
end
