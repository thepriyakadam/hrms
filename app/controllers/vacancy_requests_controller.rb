class VacancyRequestsController < ApplicationController
  before_action :set_vacancy_request, only: [:show, :edit, :update, :destroy]

  # GET /vacancy_requests
  # GET /vacancy_requests.json
  def index
    @vacancy_requests = VacancyRequest.all
  end

  # GET /vacancy_requests/1
  # GET /vacancy_requests/1.json
  def show
  end

  # GET /vacancy_requests/new
  def new
    @vacancy_request = VacancyRequest.new
  end

  # GET /vacancy_requests/1/edit
  def edit
  end

  # POST /vacancy_requests
  # POST /vacancy_requests.json
  def create
    @vacancy_request = VacancyRequest.new(vacancy_request_params)

    respond_to do |format|
      if @vacancy_request.save
        
        @vacancy_request.update(current_status: "Pending")
        VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,status: "Pending",action_by_id: current_user.employee_id,action_date: Date.today)
        
        format.html { redirect_to @vacancy_request, notice: 'Vacancy request was successfully created.' }
        format.json { render :show, status: :created, location: @vacancy_request }
      else
        format.html { render :new }
        format.json { render json: @vacancy_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancy_requests/1
  # PATCH/PUT /vacancy_requests/1.json
  def update
    respond_to do |format|
      if @vacancy_request.update(vacancy_request_params)
        format.html { redirect_to @vacancy_request, notice: 'Vacancy request was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy_request }
      else
        format.html { render :edit }
        format.json { render json: @vacancy_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancy_requests/1
  # DELETE /vacancy_requests/1.json
  def destroy
    @vacancy_request.destroy
    respond_to do |format|
      format.html { redirect_to vacancy_requests_url, notice: 'Vacancy request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approval_list
    current_login = Employee.find(current_user.employee_id)
    subordinate = current_login.subordinates.pluck(:id)
    indirect_subordinate = current_login.indirect_subordinates.pluck(:id)
    @vacancy_request_pending = VacancyRequest.where(approval_by_id: subordinate).where("current_status = ? || current_status = ?","Pending","Approved & Send Next")
    @vacancy_request_first_approved = VacancyRequest.where(request_by_id: indirect_subordinate).where("current_status = ? ","FirstApproved")
  end

  def approval_detail
    @vacancy_request = VacancyRequest.find(params[:vacancy_request])
    @vacancy_requests = VacancyRequest.where(id: @vacancy_request.id)
    @employee = Employee.find_by(id: @vacancy_request.request_by_id)
  end

  def cancel
    @vacancy_request = VacancyRequest.find(params[:format])
    VacancyRequestStaus.create(vacancy_request_id: @vacancy_request.id,action_by: current_user.employee_id,status: "Cancelled") 
    @vacancy_request.update(current_status: "Cancelled",approval_by_id: current_user.employee_id)
    flash[:notice] = "Vacancy Request Cancelled Successfully!"
    redirect_to vacancy_requests_path
  end

  def first_approve
    @vacancy_request = VacancyRequest.find(params[:format])
    employee = Employee.find_by(id: @vacancy_request.request_by_id)
    first_manager_id = employee.manager_id 
    second_manager_id = employee.manager_2_id 
    @vacancy_request.update(current_status: "FirstApproved",approval_by_id: current_user.employee_id)
    VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,action_by_id: current_user.employee_id,action_date: Date.today,status: "FirstApproved")
    flash[:notice] = 'Vacancy Request Approved Successfully at First Level'
    redirect_to approval_list_vacancy_requests_path
  end

  def approve
    @vacancy_request = VacancyRequest.find(params[:format])
    @vacancy_request.update(current_status: "Approved",approval_by_id: current_user.employee_id)
    VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,action_by_id: current_user.employee_id,action_date: Date.today,status: "Approved")
    flash[:notice] = 'Vacancy Request Approved Successfully'
    redirect_to approval_list_vacancy_requests_path
  end

  def reject
    @vacancy_request = VacancyRequest.find(params[:format])
    @vacancy_request.update(current_status: "Rejected",approval_by_id: current_user.employee_id)
    VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,action_by_id: current_user.employee_id,action_date: Date.today,status: "Rejected")
    flash[:alert] = 'Vacancy Request Rejected'
    redirect_to approval_list_vacancy_requests_path
  end

  def approve_and_send_next
    @vacancy_request = VacancyRequest.find(params[:format])
    # emp =  current_user.employee_id
    employee = Employee.find_by(id: current_user.employee_id)
    first_manager_id = employee.manager_id
    @vacancy_request.update(current_status: "Approved & Send Next",approval_by_id: current_user.employee_id)
    VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,action_by_id: current_user.employee_id,action_date: Date.today,status: "Approved & Send Next")
    flash[:notice] = 'Vacancy Request Sent to Higher Authority for Approval'
    redirect_to approval_list_vacancy_requests_path
  end

  def final_approval_list
    @vacancy_requests = VacancyRequest.where(current_status: "Approved")
  end

  def final_approve
    @vacancy_request = VacancyRequest.find(params[:format])
    @vacancy_request.update(current_status: "FinalApproved",approval_by_id: current_user.employee_id)
    VacancyRequestStatus.create(vacancy_request_id: @vacancy_request.id,action_by_id: current_user.employee_id,action_date: Date.today,status: "FinalApproved")
    flash[:notice] = 'Vacancy Request Approved Successfully'
    redirect_to final_approval_list_vacancy_requests_path
  end

  def admin_approval
    @vacancy_requests = VacancyRequest.where.not(current_status: "FinalApproved")
  end

  def admin_approval_detail
     @vacancy_request = VacancyRequest.find(params[:vacancy_request])
    @vacancy_requests = VacancyRequest.where(id: @vacancy_request.id)
    @employee = Employee.find_by(id: @vacancy_request.request_by_id)
  end

  def select_candidate

    @vacancy_requests = VacancyRequest.where(current_status: "FinalApproved")

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy_request
      @vacancy_request = VacancyRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_request_params
      params.require(:vacancy_request).permit(:vacancy, :no_of_position, :description, :request_by_id, :approval_by_id, :request_date, :qualification, :skill_set, :employee_designation_id, :department_id, :experience, :current_status, :vacancy_type)
    end
end
