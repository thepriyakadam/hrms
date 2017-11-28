class UserPasswordMailer < ApplicationMailer
  def welcome_email(user, pass)
    @user = user
    @password = pass
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def test
    mail(to: 'hrms@sganalytics.com', subject: 'Welcome to My Awesome Site')
  end
end
