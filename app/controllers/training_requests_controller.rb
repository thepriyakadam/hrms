class TrainingRequestsController < ApplicationController
  before_action :set_training_request, only: [:show, :edit, :update, :destroy]

  # GET /training_requests
  # GET /training_requests.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @training_requests = TrainingRequest.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @training_requests = TrainingRequest.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @training_requests = TrainingRequest.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="trainingmgmt"
  end

  # GET /training_requests/1
  # GET /training_requests/1.json
  def show
   @trainee_requests =TraineeRequest.where(training_request_id: @training_request.id)
   @reporting_masters_training_reqs = ReportingMastersTrainingReq.where(training_request_id: @training_request.id)
  end

  # GET /training_requests/new
  def new
    @training_request = TrainingRequest.new
    @employees = Employee.where(department_id: current_user.department_id)
     session[:active_tab] ="ManagerSelfService"
  end

  # GET /training_requests/1/edit
  def edit
  end

  # POST /training_requests
  # POST /training_requests.json
  def create
    @training_request = TrainingRequest.new(training_request_params)
    @training_request.status = "Pending"
    a=current_user.employee_id
    emp = Employee.where(id: a).take
    @employee_ids = params[:employee_ids]
    # byebug
     if @employee_ids.nil?
          flash[:alert] = "Please Select the Checkbox"
          redirect_to new_training_request_path
        else
          if @training_request.employee.try(:manager_id).nil?
            flash[:alert] = "Reporting Manager not set please set Reporting Manager"
            redirect_to new_training_request_path
          else
          if @training_request.is_there?
            flash[:alert] = "Your Request already has been sent"
            redirect_to new_training_request_path
         else
          @employee_ids.each do |eid|
          @training_request.save
          @emp_total = @employee_ids.count
          TrainingRequest.where(id: @training_request.id).update_all(no_of_employee: @emp_total)
          TrainingRequest.where(id: @training_request.id).update_all(reporting_master_id: emp.manager_id,no_of_employee: @emp_total,status: "Pending")
          TraineeRequest.create(employee_id: eid,training_request_id: @training_request.id,training_topic_master_id: @training_request.training_topic_master_id,is_complete: true)
          end
          TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: @training_request.status)
          ReportingMastersTrainingReq.create(reporting_master_id: current_user.employee_id, training_request_id: @training_request.id,training_status: "Pending")
          TraineeRequest.where(training_request_id: @training_request.id).update_all(reporting_master_id: @training_request.reporting_master_id)
          # TrainingRequestMailer.training_request(@training_request).deliver_now
          flash[:notice] = 'Training Request Created Successfully'
          redirect_to new_training_request_path
        end
  end
end
end

def training_request_form
  @employees = Employee.where(status: "Active")
end

def training_create_form
    @training_request = TrainingRequest.new(training_request_params)

    a=current_user.employee_id
    emp = Employee.where(id: a).take
    @employee_ids = params[:employee_ids]
    # byebug
     if @employee_ids.nil?
          flash[:alert] = "Please Select the Checkbox"
          redirect_to new_training_request_path
        else
          if @training_request.employee.try(:manager_id).nil?
            flash[:alert] = "Reporting Manager not set please set Reporting Manager"
            redirect_to new_training_request_path
          else
          if @training_request.is_there?
            flash[:alert] = "Your Request already has been sent"
            redirect_to new_training_request_path
         else
          @employee_ids.each do |eid|
          @training_request.save
          @emp_total = @employee_ids.count
          TrainingRequest.where(id: @training_request.id).update_all(no_of_employee: @emp_total)
          TrainingRequest.where(id: @training_request.id).update_all(reporting_master_id: emp.manager_id,no_of_employee: @emp_total,status: "FinalApproved")
          TraineeRequest.create(employee_id: eid,training_request_id: @training_request.id,training_topic_master_id: @training_request.training_topic_master_id,is_complete: true)
          TrainingPlan.create(training_date: @training_request.training_date,no_of_employee: @training_request.no_of_employee,place: @training_request.place,training_topic_master_id: @training_request.training_topic_master_id,
            training_request_id: @training_request.id, )

          end
          # TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: @training_request.status)
          # ReportingMastersTrainingReq.create(reporting_master_id: current_user.employee_id, training_request_id: @training_request.id,training_status: "FinalApproved")
          # TraineeRequest.where(training_request_id: @training_request.id).update_all(reporting_master_id: @training_request.reporting_master_id)
          # TrainingPlan.create(training_date: ,no_of_employee: ,)
          # Trainee.create(employee_id: @trainee_request.employee_id,training_plan_id: @training_plan.id)

          # TrainingRequestMailer.training_request(@training_request).deliver_now
          flash[:notice] = 'Training Request Created Successfully'
          redirect_to training_request_form_training_requests_path
        end
  end
end
end

  def create_department_wise_training_request
    @training_request = TrainingRequest.new(training_request_params)
    @training_request.status = "Pending"
    #@reporting_master = params[:training_request][:reporting_master_id]
    #@rep_master = ReportingMaster.where(id: @reporting_master)
     a=current_user.employee_id
      emp = Employee.where(id: a).take
      @employee_ids = params[:employee_ids]
       if @employee_ids.nil?
            flash[:alert] = "Please Select the Checkbox"
            redirect_to department_wise_search_training_requests_path
          else
            if @training_request.employee.try(:manager_id).nil?
              flash[:alert] = "Reporting Manager not set please set Reporting Manager"
              redirect_to department_wise_search_training_requests_path
            else
            if @training_request.is_there?
              flash[:alert] = "Your Request already has been sent"
              redirect_to department_wise_search_training_requests_path
           else
            @employee_ids.each do |eid|
            @training_request.save
            @emp_total = @employee_ids.count
            TrainingRequest.where(id: @training_request.id).update_all(no_of_employee: @emp_total)
            TrainingRequest.where(id: @training_request.id).update_all(reporting_master_id: current_user.employee_id,status: "SecondApproved")
            TraineeRequest.create(employee_id: eid,training_request_id: @training_request.id,training_topic_master_id: @training_request.training_topic_master_id,is_complete: true)
            end
            TrainingApproval.create(training_request_id: @training_request.id,employee_id: @training_request.employee_id, training_topic_master_id: @training_request.training_topic_master_id,reporting_master_id: @training_request.reporting_master_id,traininig_period: @training_request.training_period,training_date: @training_request.training_date,place: @training_request.place,no_of_employee: @training_request.no_of_employee,description: @training_request.description,justification: @training_request.justification,current_status: @training_request.status)
            ReportingMastersTrainingReq.create(reporting_master_id: current_user.employee_id, training_request_id: @training_request.id,training_status: "SecondApproved")
            TraineeRequest.where(training_request_id: @training_request.id).update_all(reporting_master_id: @training_request.reporting_master_id)
            # TrainingRequestMailer.training_request(@training_request).deliver_now
            flash[:notice] = 'Training Request Created Successfully'
            redirect_to department_wise_search_training_requests_path
          end
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
    @training_requests = TrainingRequest.where("reporting_master_id = ? and (status = ? or status = ? or status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] = "trainingmgmt"
  end

  def all_training_request_list

  end

  def training_request_confirmation
    @training_request = TrainingRequest.find(params[:training_request_id])
    @trainee_requests =TraineeRequest.where(training_request_id: @training_request.id,is_complete: true)
    # @trainee_requests = TraineeRequest.where(training_request_id: @training_request.id) 
 end

  def selected_employee_training_list
    # byebug
    @training_request = TrainingRequest.find(params[:id])
    @trainee_request_ids = params[:trainee_request_ids]
    @emp_total = @trainee_request_ids.count
    TrainingRequest.where(id: @training_request.id).update_all(no_of_employee: @emp_total)
    @trainee_request1 = TraineeRequest.where(training_request_id: @training_request.id).update_all(is_complete: nil)
    @trainee_request_ids.try(:each) do |tid|
    @trainee_request = TraineeRequest.find(tid)
    # byebug
    @trainee_request.update(is_complete: true) 
    flash[:notice] = "Confirmed Successfully"
    end
    @trainee_requests =TraineeRequest.where(id: @trainee_request_ids,is_complete: true)
    @training_requests = TrainingRequest.where(id: @training_request.id).take
  end

 def first_approve
    # byebug
    @training_request = TrainingRequest.find(params[:format])
    first_manager_id = @training_request.employee.manager_id
    second_manager_id = @training_request.employee.manager_2_id
    if @training_request.status == "FirstApproved"
    @training_request.update(status: "SecondApproved")
    ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: second_manager_id,training_status: "SecondApproved")
    flash[:notice] = 'Training Request Approved Successfully at First Level'
     redirect_to training_request_list_training_requests_path
   elsif @training_request.status == "Approved & Send Next"
     reporting_master = @training_request.reporting_master_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
    @training_request.update(status: "SecondApproved",reporting_master_id: first_manager_id)
    ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "SecondApproved")
    flash[:notice] = 'Training Request Approved Successfully'
     redirect_to training_request_list_training_requests_path
    else
     reporting_master = @training_request.reporting_master_id #new code
     employee = Employee.where(id: reporting_master).take #new code
     first_manager_id = employee.manager_id #new code
     second_manager_id = employee.manager_2_id #new code
    @training_request.update(reporting_master_id: first_manager_id,status: "FirstApproved")
    ReportingMastersTrainingReq.create(reporting_master_id: current_user.employee_id, training_request_id: @training_request.id,training_status: "FirstApproved")
    flash[:notice] = 'Training Request Approved Successfully'
     redirect_to training_request_list_training_requests_path
    end
  end

 def approve_and_send_next
    # byebug
    @training_request = TrainingRequest.find(params[:format])
     reporting_master = @training_request.reporting_master_id
     employee = Employee.where(id: reporting_master).take
     first_manager_id = employee.manager_id
     second_manager_id = employee.manager_2_id
     if employee.manager_id.present? && employee.manager_2_id.present?
        @training_request.update(reporting_master_id: first_manager_id,status: "Approved & Send Next")
        ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "Approved & Send Next")
        flash[:notice] = 'Training Request Sent to Higher Authority for Approval'
        redirect_to training_request_list_training_requests_path
     elsif employee.manager_2_id.nil?
           @training_request.update(reporting_master_id: first_manager_id,status: "Approved & Send Next")
           ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "Approved & Send Next")
           flash[:notice] = 'Training Request Approved Successfully'
          redirect_to training_request_list_training_requests_path
     end
  end

  def modal_reject_comment
     @training_request = TrainingRequest.find(params[:format])
  end

  def comment
     @training_request = TrainingRequest.find(params[:training_request_id])
     @comment = params[:training_request][:comment]
     @training_request.update(comment: @comment)
     redirect_to training_request_confirmation_training_requests_path(training_request_id: @training_request.id)
     flash[:notice] = 'Comment Updated Successfully'
  end

  def confirmation_list
   @training_requests = TrainingRequest.all
   session[:active_tab] = "trainingmgmt" 
  end

  def approve_training_request
    # byebug
  #new code
     @training_request = TrainingRequest.find(params[:format])
     first_manager_id = @training_request.employee
    if @training_request.status == "Pending"
     @training_request.update(status: "SecondApproved")
      ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "SecondApproved")
      flash[:notice] = 'Training Request Approved Successfully'
      redirect_to new_training_request_path

     elsif  @training_request.status == "Approved & Send Next"
      reporting_master = @training_request.reporting_master_id
      employee = Employee.where(id: reporting_master).take
      first_manag_id = employee.manager_id
      @training_request.update(status: "SecondApproved")
      ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "SecondApproved")
      flash[:notice] = 'Training Request Approved Successfully'
      redirect_to training_request_list_training_requests_path
     else
    end
  end


  def reject_training_request
    @training_request = TrainingRequest.find(params[:format])
    @training_request.update(status: "Rejected",reporting_master_id: current_user.employee_id)
    ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "Rejected")
    flash[:alert] = 'Training Request Rejected'
    redirect_to training_request_list_training_requests_path
  end

   def final_approve
    @training_request = TrainingRequest.find(params[:format])
    @training_request.update(status: "FinalApproved",reporting_master_id: current_user.employee_id)
    ReportingMastersTrainingReq.create(training_request_id: @training_request.id,reporting_master_id: current_user.employee_id,training_status: "FinalApproved")
    if @training_request.status == "FinalApproved"
      flash[:notice] = 'Training Request Approved Successfully'
      redirect_to final_approval_training_list_training_requests_path
    else
      flash[:notice] = 'Training Request Approved Successfully'
      redirect_to training_request_list_training_requests_path
    end
  end

  def final_approval_training_list
     @training_requests = TrainingRequest.where(status: "SecondApproved")
  end

  def emp_training_history
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @training_requests = TrainingRequest.group(:employee_id)
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'HOD'
        # byebug
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @training_requests = TrainingRequest.where(employee_id: @employees).group(:employee_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @training_requests = TrainingRequest.where(employee_id: @employees).group(:employee_id)
      else current_user.role.name == 'Employee'
        @training_requests = TrainingRequest.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="trainingmgmt"
  end

  def department_wise_search
    session[:active_tab] = "trainingmgmt"
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