class LeaveRequestMailer < ApplicationMailer
  def first_approve(request)
    email = request.try(:first_reporter).try(:email)
    mail(to: email, subject: 'Leave Approval')
  end

  def second_approve(request)
    email = request.try(:second_reporter).try(:email)
    mail(to: email, subject: 'Leave Approval')
  end

  def first_reject(request)
    email = request.try(:first_reporter).try(:email)
    mail(to: email, subject: 'Leave Rejection')
  end

  def second_reject(request)
    email = request.try(:second_reporter).try(:email)
    mail(to: email, subject: 'Leave Rejection')
  end

  def cancel(request)
    email = request.try(:first_reporter).try(:email)
    mail(to: email, subject: 'Leave Cancelled')
  end
end
#UserPasswordMailer.welcome_email(company,pass).deliver_now