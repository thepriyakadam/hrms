require 'query_report/helper' # need to require the helper
class VacancyMastersController < ApplicationController
  before_action :set_vacancy_master, only: [:show, :edit, :update, :destroy]

  # GET /vacancy_masters
  # GET /vacancy_masters.json
  include QueryReport::Helper # need to include it
  def index
      respond_to do |format|
      format.html
      format.csv { send_data @vacancy_masters.to_csv }
      format.xls
      if current_user.class == Member
        if current_user.role.name == 'Department'
          @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id)
        elsif current_user.role.name == 'CompanyLocation'
          @vacancy_masters = VacancyMaster.where(company_location_id: current_user.company_location_id)
        elsif current_user.role.name == 'Company'
          @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id)
        end
      end
     end
      session[:active_tab] ="recruitment"
  end


  # GET /vacancy_masters/1
  # GET /vacancy_masters/1.json
  def show
  end

  # GET /vacancy_masters/new
  def new
    @vacancy_master = VacancyMaster.new
  end

  def import
    VacancyMaster.import(params[:file])
    redirect_to root_url, notice: 'Vacancy Master imported successfully........!'
  end

  # GET /vacancy_masters/1/edit
  def edit
  end

  # POST /vacancy_masters
  # POST /vacancy_masters.json
  

  def create
    @vacancy_master = VacancyMaster.new(vacancy_master_params)
    # @vacancy = Department.find(@vacancy_master.department_id)
    # @vacancy_master.company_location_id = @vacancy.company_location_id
    @vacancy_master.current_status = "Pending"

    respond_to do |format|
      if @vacancy_master.save
        len = @vacancy_master.no_of_position
        for i in 1..len
        ParticularVacancyRequest.create(vacancy_master_id: @vacancy_master.id,employee_id: @vacancy_master.employee_id,employee_designation_id: @vacancy_master.employee_designation_id,vacancy_name: @vacancy_master.vacancy_name,fulfillment_date: @vacancy_master.vacancy_post_date,status: "Pending")
        end
        ReportingMastersVacancyMaster.create(reporting_master_id: @vacancy_master.reporting_master_id, vacancy_master_id: @vacancy_master.id, vacancy_status: "Pending")
        VacancyMasterMailer.vacancy_request(@vacancy_master).deliver_now
        format.html { redirect_to @vacancy_master, notice: 'Vacancy created successfully.' }
        format.json { render :show, status: :created, location: @vacancy_master }
      else
        format.html { render :new }
        format.json { render json: @vacancy_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancy_masters/1
  # PATCH/PUT /vacancy_masters/1.json
  def update
    respond_to do |format|
      if @vacancy_master.update(vacancy_master_params)
        format.html { redirect_to @vacancy_master, notice: 'Vacancy master was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy_master }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /vacancy_masters/1
  # DELETE /vacancy_masters/1.json
  def destroy
    @vacancy_master.destroy
    respond_to do |format|
      format.html { redirect_to vacancy_masters_url, notice: 'Vacancy master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_by_vacancy_post_date
    @vacancy_masters = VacancyMaster.all
    reporter(@vacancy_masters, template_class: PdfReportTemplate) do
      filter :vacancy_post_date, type: :date
      column :job_title, sortable: true
      column :vacancy_name, sortable: true
      column :department_name, sortable: true
      column :budget, sortable: true
      column :vacancy_post_date, sortable: true
      column :description, sortable: true
    end
  end

  def vacancy_request_confirmation
     @vacancy_master = VacancyMaster.find(params[:format])
     @vacancy_masters = VacancyMaster.where(reporting_master_id: current_user.employee_id)
  end

  def vacancy_history
    @vacancy_masters = VacancyMaster.where("reporting_master_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Pending","Approved & Send Next")
    session[:active_tab] ="recruitment"
  end 

  def modal
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def modal1
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def send_request_to_higher_authority
    puts ".................."
    @vacancy_master = VacancyMaster.find(params[:id])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
    
    @particular_vacancy_requests.each do |p|
      p.update(status: "Approved & Send Next")
    end 
    VacancyMasterMailer.approve_and_send_next_email(@vacancy_master).deliver_now
    @vacancy_master.update(current_status: "Approved & Send Next",reporting_master_id: params[:vacancy_master][:reporting_master_id])
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: params[:vacancy_master][:reporting_master_id], vacancy_status: "Approved & Send Next")
    flash[:notice] = 'Vacancy Send to Higher Authority'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def reject_vacancy
    @vacancy_master = VacancyMaster.find(params[:format])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
    
    @particular_vacancy_requests.each do |p|
      p.update(status: "Reject")
  end  

    @vacancy_master.update(current_status: "Reject")
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: current_user.employee_id, vacancy_status: "Reject")
    VacancyMasterMailer.reject_vacancy_email(@vacancy_master).deliver_now
    flash[:alert] = 'Vacancy Request Rejected'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def approve_vacancy
    @vacancy_master = VacancyMaster.find(params[:format])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)

    @particular_vacancy_requests.each do |p|
      p.update(status: "Approved",open_date: Time.zone.now.to_date)
  end    
    @vacancy_master.update(current_status: "Approved")
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: current_user.employee_id, vacancy_status: "Approved")
    VacancyMasterMailer.approve_vacancy_email(@vacancy_master).deliver_now
    flash[:notice] = 'Vacancy Request Approved'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def approve_vacancy_list
    @vacancy_masters = VacancyMaster.all
    session[:active_tab] ="recruitment"
  end

  # def cancel_vacancy_request
  #     puts "-------------------"
  #     @vacancy_master = VacancyMaster.find(params[:format])
  # end
  

  def cancel_vacancy_request
    @vacancy_master = VacancyMaster.find(params[:format])
     len = @vacancy_master.no_of_position
    @vacancy_master.update(current_status: "Cancelled")
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: current_user.employee_id, vacancy_status: "Cancelled")
    VacancyMasterMailer.cancel_vacancy_email(@vacancy_master).deliver_now
    flash[:notice] = 'Vacancy Request Cancelled'
    redirect_to vacancy_masters_path
  end

  def particular_vacancy_request_list
    @vacancy_master = VacancyMaster.find(params[:format])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
  end

  def approved_vacancy_list
     @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "Approved")
  end

  def update_no_of_positions 
    @vacancy_master = VacancyMaster.find(params[:id])
    @no_of_position = params[:particular_vacancy_request][:no_of_position]
    if @vacancy_master.no_of_position < @no_of_position.to_i
      flash[:alert] = 'No of Positions greater than max limit'
      redirect_to vacancy_history_vacancy_masters_path
    else
      @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id).limit(@no_of_position)
      @particular_vacancy_requests.each do |p|
        p.update(status: "Approved")
      end
      @vacancy_master.update(current_status: "Approved")
      flash[:notice] = "No. Of Positions Updated Successfully"
      redirect_to vacancy_history_vacancy_masters_path
    end 
  end

  def is_closed
      #byebug
      @particular_vacancy_request =  ParticularVacancyRequest.find(params[:format])
      @particular_vacancy_request.update(is_complete: true)
      flash[:notice] = "Vacancy Request Closed Successfully"
      redirect_to vacancy_masters_path
  end

  def vacancy_resume
      @vacancy_masters = VacancyMaster.all
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_vacancy_master
    @vacancy_master = VacancyMaster.find(params[:id])
  end

  # Never trust param eters from the scary internet, only allow the white list through.
  def vacancy_master_params
    params.require(:vacancy_master).permit(:employee_designation_id,:justification,:employee_id,:current_status,:experience,:degree_1_id,:degree_2_id,:reporting_master_id,:keyword,:other_organization, :department_id, :degree_id, :company_location_id, :vacancy_name, :no_of_position, :description, :vacancy_post_date, :budget)
  end
end
