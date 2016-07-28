class TrainingRequestsController < ApplicationController
  before_action :set_training_request, only: [:show, :edit, :update, :destroy]

  # GET /training_requests
  # GET /training_requests.json
  def index
    @training_requests = TrainingRequest.all
  end

  # GET /training_requests/1
  # GET /training_requests/1.json
  def show
    @trainee_requests = TraineeRequest.where(training_request_id: @training_request.id)
    @reporting_master = ReportingMaster.find(@training_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
  end

  # GET /training_requests/new
  def new
    @training_request = TrainingRequest.new
    #@training_requests = TrainingRequest.all
    @employees = Employee.where(department_id: current_user.department_id)
    session[:active_tab] ="trainingmgmt"
  end

  # GET /training_requests/1/edit
  def edit
  end

  # POST /training_requests
  # POST /training_requests.json
  def create
    @training_request = TrainingRequest.new(training_request_params)
    @training_request.status = "Pending"
    #@reporting_master = params[:training_request][:reporting_master_id]
    #@rep_master = ReportingMaster.where(id: @reporting_master)
    respond_to do |format|
      if @training_request.save
        @employee_ids = params[:employee_ids]
        @employee_ids.each do |eid|
        @emp_total = @employee_ids.count
        # @reporting_master = params[:training_request][:reporting_master_id]
        # @rep_master = ReportingMaster.find(@reporting_master)
        TrainingRequest.where(id: @training_request.id).update_all(no_of_employee: @emp_total)
        TraineeRequest.create(employee_id: eid,training_request_id: @training_request.id,training_topic_master_id: @training_request.training_topic_master_id)
      end
        format.html { redirect_to @training_request, notice: 'Training request was successfully created.' }
        format.json { render :show, status: :created, location: @training_request }
      else
        format.html { render :new }
        format.json { render json: @training_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_requests/1
  # PATCH/PUT /training_requests/1.json
  def update
    respond_to do |format|
      if @training_request.update(training_request_params)
        format.html { redirect_to @training_request, notice: 'Training request was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_request }
      else
        format.html { render :edit }
        format.json { render json: @training_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_requests/1
  # DELETE /training_requests/1.json
  def destroy
    @training_request.destroy
    respond_to do |format|
      format.html { redirect_to training_requests_url, notice: 'Training request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def training_request_list
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @training_requests = TrainingRequest.where(reporting_master_id: @reporting_masters)
    session[:active_tab] ="trainingmgmt"
  end

  def training_request_confirmation
    @training_request = TrainingRequest.find(params[:format])
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@training_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @training_requests = TrainingRequest.where(reporting_master_id: reporting_masters)
    @trainee_requests =TraineeRequest.where(training_request_id: @training_request.id)
  end

  def approve_training_request
    @training_request = TrainingRequest.find(params[:id])
    @training_request.update(status: "Approved")
    TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: "Approved")
    ReportingMastersTrainingReq.create(reporting_master_id: @training_request.reporting_master_id, training_request_id: @training_request.id, training_status: "Approved")
    # byebug
    @trainee_request_ids = params[:trainee_request_ids]
    if @trainee_request_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to interview_schedules_path
    else
      @trainee_request_ids.each do |tid|
      @trainee_request = TraineeRequest.find(tid)
      @trainee_request.update(is_complete: "Approved") 
      # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      flash[:notice] = "Approved Successfully"
      redirect_to interview_schedules_path
    end 
  end

     @comment = params[:training_request][:comment]
     @training_request.update(comment: @comment)
     flash[:notice] = 'Comment Updated Successfully'
    #TrainingRequestMailer.approve_training_request_email(@training_request).deliver_now
  end

  def modal_approver_comment
     @training_request = TrainingRequest.find(params[:format])
     reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@training_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @training_requests = TrainingRequest.where(reporting_master_id: reporting_masters)
    @trainee_requests =TraineeRequest.where(training_request_id: @training_request.id)
  end

  def modal_reject_comment
     @training_request = TrainingRequest.find(params[:format])
  end



  def confirmation_list
   @training_requests = TrainingRequest.where(status:"Approved")  
  end


  def reject_training_request
    @training_request = TrainingRequest.find(params[:id])
    @training_request.update(status: "Reject")
    TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: "Reject")
    ReportingMastersTrainingReq.create(reporting_master_id: @training_request.reporting_master_id, training_request_id: @training_request.id, training_status: "Reject")
    #TrainingRequestMailer.reject_training_request_email(@training_request).deliver_now
    
    @comment = params[:training_request][:comment]
    @training_request.update(comment: @comment)
    flash[:alert] = 'Comment Updated Successfully'
    redirect_to training_request_list_training_requests_path
  end

  def department_wise_search
  end

  def show_dept_wise_form
    @training_request = TrainingRequest.new
    @department = Department.find(params[:department_id])
    @employees = Employee.where(department_id: @department.id)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_request
      @training_request = TrainingRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_request_params
      params.require(:training_request).permit(:no_of_employee,:place,:justification,:employee_id, :training_topic_master_id, :training_period, :training_date, :reporting_master_id, :description)
    end
end