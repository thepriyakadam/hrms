class GreetingsController < ApplicationController
#before_action :set_greeting, only: [:show, :edit, :update, :destroy]

	def modal_for_mail
    @employee = Employee.find(params[:format])
    @greeting = Greeting.new
  end

  def send_mail
    message = params[:message]
    employee_id = params[:employee_id]
    @greeting = Greeting.create(date: Date.today,message: message,sender: current_user.employee_id,receiver: employee_id,status: true)
     GreetingMailer.send_email_to_employee(employee_id,@greeting).deliver_now
  end

end
