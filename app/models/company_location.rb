class CompanyLocation < ActiveRecord::Base
  belongs_to :company
  has_one :member, as: :account

  def create_user(company_location, pass)
  	@member = Member.new
  	@member.email = company_location.name
    p "--------------------------------------------------------"
  	p pass
    p "--------------------------------------------------------"
  	@member.password = '12345678'
  	@member.save
    @member.update_attribute(:account, company_location)
  	#UserPasswordMailer.welcome_email(@member,pass).deliver_now
  end
end
