class GreetingsController < ApplicationController
before_action :set_greeting, only: [:show, :edit, :update, :destroy]
  
	def modal_for_mail
    @employee = Employee.find(params[:emp_id])
    @greeting = Greeting.new
  end

  def send_mail
    message = params[:greeting][:message]
    employee_id = params[:employee_id]
    #type = params[:type]
    @greeting = Greeting.create(date: Date.today,message: message,sender_id: current_user.employee_id,receiver_id: employee_id,status: true)
    GreetingMailler.send_email_to_employee(@greeting).deliver_now
    flash[:notice] = "Birthday Greeting Send Successfully!"
    redirect_to root_path
  end

  def anniversary_mail
    @employee = Employee.find(params[:emp_id])
    @greeting = Greeting.new
  end

  def send_anniversary_mail
    message = params[:greeting][:message]
    employee_id = params[:employee_id]
    @greeting = Greeting.create(date: Date.today,message: message,sender_id: current_user.employee_id,receiver_id: employee_id,status: true)
    GreetingMailler.send_anniversary_mail_to_employee(@greeting).deliver_now
    flash[:notice] = "Anniversary Greeting Send Successfully!"
    redirect_to root_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_greeting
  #     @greeting = Greeting.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def greeting_params
  #     params.require(:greeting).permit(:date,:type,:sender_id,:receiver_id,:message,:status)
  #   end
  end