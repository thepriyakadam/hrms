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
    respond_to do |format|
      if @training_request.save
        @employee_ids = params[:employee_ids]
        @employee_ids.each do |eid|
        TraineeRequest.create(employee_id: eid,training_request_id: @training_request.id)
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
    @training_requests = TrainingRequest.where(reporting_master_id: current_user.employee_id)
    session[:active_tab] ="trainingmgmt"
  end

  def training_request_confirmation
    @training_request = TrainingRequest.find(params[:format])
    @training_requests = TrainingRequest.where(reporting_master_id: current_user.employee_id)
  end

  def approve_training_request
    @training_request = TrainingRequest.find(params[:format])
    @training_request.update(status: "Approved")
    TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: "Approved")
    ReportingMastersTrainingReq.create(reporting_master_id: @training_request.reporting_master_id, training_request_id: @training_request.id, training_status: "Approved")
    #TrainingRequestMailer.approve_training_request_email(@training_request).deliver_now
    flash[:notice] = 'Training Request Approved'
    redirect_to training_request_list_training_requests_path
  end



  def confirmation_list
   @training_requests = TrainingRequest.where(employee_id: current_user.employee_id,status:"Approved")  
  end


  def reject_training_request
    @training_request = TrainingRequest.find(params[:format])
    @training_request.update(status: "Reject")
    TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: "Reject")
    ReportingMastersTrainingReq.create(reporting_master_id: @training_request.reporting_master_id, training_request_id: @training_request.id, training_status: "Reject")
    #TrainingRequestMailer.reject_training_request_email(@training_request).deliver_now
    
    flash[:alert] = 'Training Request Rejected'
    redirect_to training_request_list_training_requests_path
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