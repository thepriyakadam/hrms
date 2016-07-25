class DueDetailsController < ApplicationController
  before_action :set_due_detail, only: [:show, :edit, :update, :destroy]

  # GET /due_details
  # GET /due_details.json
  def index
    @due_details = DueDetail.all
  end

  # GET /due_details/1
  # GET /due_details/1.json
  def show
  end

  # GET /due_details/new
  def new
    # byebug
    @due_detail = DueDetail.new
    @due_template = DueTemplate.find(params[:due_template_id])
    @due_details = DueDetail.where(due_template_id: @due_template.id)
  end

  # GET /due_details/1/edit
  def edit
  end

  def create
    @due_detail = DueDetail.new(due_detail_params)
    @due_details = DueDetail.all
    if @due_detail.save
      @due_detail = DueDetail.new
    end
    @due_template_id = DueTemplate.find(params[:due_detail][:due_template_id])
    flash[:notice] = 'Due Detail created Successfully.'   
    redirect_to new_due_detail_path(due_template_id: @due_template_id.id)
  end

  def update
    @due_detail.update(due_detail_params)
    @due_details = DueDetail.all
    @due_detail = DueDetail.new
    redirect_to new_due_detail_path
    flash[:notice] = 'Due Detail updated Successfully.'   
  end

  def destroy
    @due_detail.destroy
    @due_details = DueDetail.all
  end

  def all_employee_resignation_list
     @employee_resignations = EmployeeResignation.all
     session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  def is_confirm
    @due_detail_ids = params[:due_detail_ids]
    if @due_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to root_url
    else
      @due_detail_ids.each do |did|
      @due_detail = DueDetail.find(did)
      @due_detail.update(is_confirmed: true) 
      # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      flash[:notice] = "Confirmed Successfully"
    end 
     redirect_to root_url
  end
  end

  def due_detail_history
     @due_details = DueDetail.where(reporting_master_id: current_user.employee_id,is_confirmed: true)
  end

  def show_due_template_list
     @due_template = DueTemplate.find(params[:due_template_id])
     @due_templates = DueTemplate.where(id: @due_template.id)
     @due_details = DueDetail.where(due_template_id: @due_template.id)
  end

  def all_due_template
     @employee_resignation = EmployeeResignation.find(params[:format])
     @employee = Employee.find(@employee_resignation.employee_id)
  end

  def create_due_employee_detail
    # byebug
    # @due_employee_detail = DueEmployeeDetail.new(due_employee_detail_params)
    @emp = params[:due_employee_detail][:employee_id]
    @due_template = params[:due_template_id][:hhh]
    # @due_employee_detail.save
    @due_detail_ids = params[:due_detail_ids]
    @due_detail_ids.each do |did|
    DueEmployeeDetail.create(reporting_master_id: did,employee_id: @emp,due_template_id: @due_template,is_confirmed: true)
    end
    flash[:notice] = "Created Successfully & Request Also Sent"
    redirect_to root_url
  end


  def employee_due_detail_history
    @due_employee_details = DueEmployeeDetail.where(reporting_master_id: current_user.employee_id,is_confirmed: true)
    session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  def all_employee_due_detail
     @due_employee_details = DueEmployeeDetail.where(is_confirmed: nil)
      session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  def is_confirm_employee_due
     @due_employee_detail_ids = params[:due_employee_detail_ids]
    if @due_employee_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to root_url
    else
      @due_employee_detail_ids.each do |did|
        @due_employee_detail = DueEmployeeDetail.find(did)
        @due_employee_detail.update(is_confirmed: true) 
        # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
        flash[:notice] = "Confirmed Successfully"
      end
      redirect_to root_url
    end
  end

  def due_employee_detail_list
     # @due_employee_details = DueEmployeeDetail.where(is_confirmed: true)
     @employee_resignation = EmployeeResignation.find(params[:format])
     @employee = Employee.find(@employee_resignation.employee_id)
     @due_employee_details = DueEmployeeDetail.where(employee_id: @employee.id,is_confirmed: true)
  end

  def due_action_list
    @due_employee_detail = DueEmployeeDetail.find(params[:format])
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
  end


  def emp_resignation
    @employee_resignations = EmployeeResignation.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_detail
      @due_detail = DueDetail.find(params[:id])
    end
    
    def due_employee_detail_params
      params.require(:due_employee_detail).permit(:employee_id, :due_template_id, :due_employee_template_id, :due_detail_id,:reporting_master_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_detail_params
      params.require(:due_detail).permit(:reporting_master_id, :due_employee_template_id, :status, :due_template_id)
    end
end
