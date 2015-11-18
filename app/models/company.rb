class Company < ActiveRecord::Base
  belongs_to :group
  #default_scope { where(group_id: 1) }
  belongs_to :company_type
  has_one :member, as: :account
  after_create :create_user_account

  # def create_user(company, pass)
  # 	@member = Member.new
  # 	@member.email = company.email
  #   p "--------------------------------------------------------"
  # 	p pass
  #   p "--------------------------------------------------------"
  # 	@member.password = '12345678'
  # 	@member.save
  #   @member.update_attribute(:account, company)
  # 	UserPasswordMailer.welcome_email(@member,pass).deliver_now
  # end

  def create_user_account
    user = Member.new do |u|
      u.email = email
      @pass=(0...8).map { (65 + rand(26)).chr}.join
      u.password = '12345678'
      u.account = company
      p "------------------------------------------------------------------"
      puts @pass
    end 
    if user.save
      @message = "Invitation for join our portal"
    end
    p user.errors
  end
end






