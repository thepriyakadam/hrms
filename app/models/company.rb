class Company < ActiveRecord::Base
  belongs_to :group
  belongs_to :company_type
  has_one :member, as: :account
  after_create :create_user_account

  def create_user_account
    company = Company.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = company
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Company Account created successfully."
      UserPasswordMailer.welcome_email(company,pass).deliver_now
    end
  end
end






