class InductionDetailsController < ApplicationController
  before_action :set_induction_detail, only: [:show, :edit, :update, :destroy]

  # GET /induction_details
  # GET /induction_details.json
  def index
    @induction_details = InductionDetail.all
  end

  # GET /induction_details/1
  # GET /induction_details/1.json
  def show
    @induction_activities = InductionActivity.where(induction_master_id: @induction_detail.induction_master_id)
  end

  # GET /induction_details/new
  def new
    @induction_detail = InductionDetail.new
    @induction_details = InductionDetail.all
  end

  # GET /induction_details/1/edit
  def edit
  end

  # POST /induction_details
  # POST /induction_details.json
 
  def create
    @induction_detail = InductionDetail.new(induction_detail_params)
    @induction_details = InductionDetail.all
    respond_to do |format|
        if @induction_detail.save
         @induction_detail = InductionDetail.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Induction Detail Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /induction_details/1
  # PATCH/PUT /induction_details/1.json
  def update
    respond_to do |format|
      if @induction_detail.update(induction_detail_params)
        format.html { redirect_to @induction_detail, notice: 'Induction detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @induction_detail }
      else
        format.html { render :edit }
        format.json { render json: @induction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    @induction_detail.update(induction_detail_params)
    @induction_details = InductionDetail.all
    @induction_detail = InductionDetail.new
  end

  def destroy
    @induction_detail.destroy
    @induction_details = InductionDetail.all
  end

  def all_induction_detail_list
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @induction_details = InductionDetail.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @induction_details = InductionDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @induction_details = InductionDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @induction_details = InductionDetail.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @induction_details = InductionDetail.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @induction_details = InductionDetail.where(employee_id: @employees)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
   session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="EmployeeInduction"
  end

  def confirm
    @induction_detail = InductionDetail.find(params[:format])
    @induction_detail.update(induction_completed: true,end_date: Time.zone.now.to_date)
    redirect_to all_induction_detail_list_induction_details_path
    flash[:notice] = 'Induction Confirmed Successfully'
  end

  def print_induction_details
    @induction_detail = InductionDetail.find(params[:id])
    # byebug
    @c1 = Employee.find(@induction_detail.employee_id)
    # @companies = Company.where( : @c1.id)
    @induction_details = InductionDetail.all
    @induction_activities = InductionActivity.where(induction_master_id: @induction_detail.induction_master_id)
     respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_induction_details',
        layout: '/layouts/pdf.html.erb',
        :template => 'induction_details/print_induction_details.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
      end
    end
  end

  def update_date_modal
     @induction_detail = InductionDetail.find(params[:format])
  end

  def update_date
    @induction_detail = InductionDetail.find(params[:id])
    @end_date = params[:induction_detail][:end_date]
    @induction_detail.update(end_date: @end_date)
    flash[:notice] = 'End Date Updated Successfully'
    redirect_to all_induction_detail_list_induction_details_path
  end

  def update_feedback
     @trainee = Trainee.find(params[:id])
     @feedback = params[:trainee][:feedback]
     @trainee.update(feedback: @feedback)
     flash[:notice] = 'Feedback Updated Successfully'
     redirect_to trainee_list_training_plans_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_detail
      @induction_detail = InductionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_detail_params
      params.require(:induction_detail).permit(:employee_id, :start_date, :end_date, :induction_master_id, :induction_completed)
    end
end
