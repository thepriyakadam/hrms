class CompanyLocation < ActiveRecord::Base
  belongs_to :company
  has_one :member, as: :account
  after_create :create_user_account

  def create_user_account
    company_location = CompanyLocation.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = company_location
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Company Location Account created successfully."
      #UserPasswordMailer.welcome_email(company_location,pass).deliver_now
    end
    p user.errors
  end
end
