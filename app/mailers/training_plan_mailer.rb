class TrainingPlanMailer < ApplicationMailer
   
    def confirmation_email_to_employee(trainee_request)
      @trainee_request = trainee_request
      @trainee_request = TraineeRequest.find(trainee_request.id)
      @employee = Employee.find(@trainee_request.employee_id)
      mail(to: @employee.email, subject: 'Training Plan Confirmation')
   end

    def send_email_to_trainer(training_plan)
  	  @training_plan = training_plan
  	  @training_plan = TrainingPlan.find(training_plan.id)
  	  # @training_plan = TrainingPlan.find(training_plan.interview_schedule_id)
  	  # @employee = Employee.find(@training_plan.employee_id)
      mail(to: @training_plan.trainer_email, subject: 'Training Plan Request')
    end

end