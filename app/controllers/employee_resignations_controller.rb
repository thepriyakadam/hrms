class EmployeeResignationsController < ApplicationController
  before_action :set_employee_resignation, only: [:show, :edit, :update, :destroy]

  # GET /employee_resignations
  # GET /employee_resignations.json
  def index
    @employee_resignations = EmployeeResignation.all
    
  end

  # GET /employee_resignations/1
  # GET /employee_resignations/1.json
  def show
  end

  # GET /employee_resignations/new
  def new
    @employee_resignation = EmployeeResignation.new
    session[:active_tab] ="resignationmanagement"  
  end

  # GET /employee_resignations/1/edit
  def edit
  end

  # POST /employee_resignations
  # POST /employee_resignations.json

  # def create
  #   @employee_resignation = EmployeeResignation.new(employee_resignation_params)
      
  #      flash[:notice]= "Email Sent Successfully"
  #     if @employee_resignation.save
        

  #        redirect_to employee_resignations_path
        
  #     else
  #        render :new 

        
  #   end
  # end

  def create
    @employee_resignation = EmployeeResignation.new(employee_resignation_params)
    
    @employee_resignation.resign_status = "Pending"
 
    respond_to do |format|
      if @employee_resignation.save
        ReportingMastersResign.create(reporting_master_id: @employee_resignation.reporting_master_id, employee_resignation_id: @employee_resignation.id,resignation_status: @employee_resignation.resign_status)
        # EmployeeResignationMailer.send_email_to_reporting_manager(@employee_resignation).deliver_now
        format.html { redirect_to @employee_resignation, notice: 'Employee Resignation created successfully.' }
        format.json { render :show, status: :created, location: @employee_resignation }
      else
        format.html { render :new }
        format.json { render json: @employee_resignation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_resignations/1
  # PATCH/PUT /employee_resignations/1.json
  def update
    @employee_resignation.update(employee_resignation_params)
    @employee_resignations = EmployeeResignation.all
    @employee_resignation = EmployeeResignation.new
    flash[:notice]= "Updated successfully"
    redirect_to employee_resignations_path
  end

  # DELETE /employee_resignations/1
  # DELETE /employee_resignations/1.json
  def destroy
    @employee_resignation.destroy
    respond_to do |format|
      format.html { redirect_to employee_resignations_url, notice: 'Employee resignation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_resignation_list
     @employee_resignations = EmployeeResignation.all
     session[:active_tab] ="resignationmanagement"
  end
  
  def resignation_history
     @employee_resignations = EmployeeResignation.where("reporting_master_id = ? and (resign_status = ? or resign_status = ?)",current_user.employee_id,"Pending","Approved & Send Next")
  end
  
  def resignation_history
     @employee_resignations = EmployeeResignation.where("reporting_master_id = ? and (resign_status = ? or resign_status = ?)",current_user.employee_id,"Pending","Approved & Send Next")
  end

  def employee_resignation_confirmation
        @employee_resignation = EmployeeResignation.find(params[:format])
        @employee_resignations = EmployeeResignation.where(reporting_master_id: current_user.employee_id)
  end
  
  def approve_resignation
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(resign_status: "Approved")
    ReportingMastersEmployeeResignation.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: current_user.employee_id, resign_status: "Approved")
   
   EmployeeResignationMailer.approve_vacancy_email(@employee_resignation).deliver_now
    flash[:notice] = 'Employee Resignation Approved'
    redirect_to resignation_history_employee_resignations_path 

    end


  def employee_resignation_confirmation
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignations = EmployeeResignation.where(reporting_master_id: current_user.employee_id)
  end

  def approve_resignation
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(resign_status: "Approved")
    EmployeeResignationMailer.approve_resignation_email(@employee_resignation).deliver_now
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: current_user.employee_id, resignation_status: "Approved")
    flash[:notice] = 'Employee Resignation Approved Successfully'
    redirect_to resignation_history_employee_resignations_path
  end

  def reject_employee_resignation
    @employee_resignation = EmployeeResignation.find(params[:format])
    @employee_resignation.update(resign_status: "Rejected")
    EmployeeResignationMailer.reject_resignation_email(@employee_resignation).deliver_now
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: current_user.employee_id, resignation_status: "Rejected")
    flash[:alert] = 'Resignation Request Rejected'
    redirect_to resignation_history_employee_resignations_path
  end

  def send_request_to_higher_authority
    puts ".................."
    @employee_resignation = EmployeeResignation.find(params[:id])
    @employee_resignation.update(resign_status: "Approved & Send Next",reporting_master_id: params[:employee_resignation][:reporting_master_id])
    ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: params[:employee_resignation][:reporting_master_id], resignation_status: "Approved & Send Next")
    flash[:notice] = 'Resignation Details Send to Higher Authority For Approval'
    redirect_to resignation_history_employee_resignations_path
  end

  def cancel_resignation_request
     @employee_resignation = EmployeeResignation.find(params[:format])
     @employee_resignation.update(resign_status: "Cancelled")
     ReportingMastersResign.create(employee_resignation_id: @employee_resignation.id, reporting_master_id: current_user.employee_id, resignation_status: "Cancelled")
     flash[:notice] = 'Vacancy Request Cancelled'
    redirect_to employee_resignations_path
  end

  def modal
    @employee_resignation = EmployeeResignation.find(params[:format])
  end

  def send_email_to_reporting_manager
  end




    private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_resignation
      @employee_resignation = EmployeeResignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_resignation_params
      params.require(:employee_resignation).permit(:employee_id, :resign_status,:reporting_master_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired)
    end
end
