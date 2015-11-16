class Company < ActiveRecord::Base
  belongs_to :group
  belongs_to :company_type
  #after_create :create_user

  def create_user(company, pass)
  	@member = Member.new
  	@member.email = company.email
  	p pass
  	@member.password = pass
  	@member.save
  	UserPasswordMailer.welcome_email(@member,pass).deliver_now
  end
end