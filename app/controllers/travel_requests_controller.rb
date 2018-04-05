class TravelRequestsController < ApplicationController
  before_action :set_travel_request, only: [:show, :edit, :update, :destroy]

  # GET /travel_requests
  # GET /travel_requests.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @travel_requests = TravelRequest.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @travel_requests = TravelRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @travel_requests = TravelRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @travel_requests = TravelRequest.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @travel_requests = TravelRequest.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestprocess"
  end

  # GET /travel_requests/1
  # GET /travel_requests/1.json
  def show
     # @reporting_master = ReportingMaster.find(@travel_request.employee_id)
     # @employee = Employee.find(@reporting_master.employee_id)
     @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
     @travel_request = TravelRequest.find_by(id: @travel_request.id)
  end

  # GET /travel_requests/new
  def new
    @travel_request = TravelRequest.new
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestprocess"
    @employee = Employee.find(current_user.employee_id)
  end

  # GET /travel_requests/1/edit
  def edit
  end

  # POST /travel_requests
  # POST /travel_requests.json
  def create
    @travel_request = TravelRequest.new(travel_request_params)
    employee_id = @travel_request.employee_id

    @travel_request.current_status = "Pending"
    #a=current_user.employee_id
    #emp = Employee.where(id: a).take
    emp = Employee.find_by(id: employee_id)
    reporting_master_id = ReportingMaster.find_by(employee_id: emp.try(:manager_id))
    # if @travel_request.is_there?
    #   flash[:alert] = "Your Request already has been sent"
    #   redirect_to travel_requests_path
    #  else
    @manager_id = emp.try(:manager_id)
    if emp.try(:manager_id).nil?
        flash[:alert] = "Reporting Manager not set please set Reporting Manager"
        redirect_to travel_requests_path
    else
      respond_to do |format|
        if @travel_request.save
          TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @manager_id,current_status: "Pending")
          ReportingMastersTravelRequest.create(reporting_master_id: @manager_id, travel_request_id: @travel_request.id,travel_status: "Pending")
          TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @manager_id, travel_option_id: @travel_request.travel_option_id,current_status: @travel_request.current_status)
          @c1 = (@travel_request.to - @travel_request.traveling_date).to_i
          # ReportingMastersTravelRequest.create(reporting_master_id: @current_user.employee_id, travel_request_id: @travel_request.id)
          # TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
          TravelRequest.where(id: @travel_request.id).update_all(day: @c1)
          # TravelRequestMailer.travel_request(@travel_request).deliver_now
          format.html { redirect_to @travel_request, notice: 'Travel request was successfully created.' }
          format.json { render :show, status: :created, location: @travel_request }
        else
          format.html { render :new }
          format.json { render json: @travel_request.errors, status: :unprocessable_entity }
        end
      end#do
    end#emp.try(:manager_id).nil?
  end
  # PATCH/PUT /travel_requests/1
  # PATCH/PUT /travel_requests/1.json
  def update
    respond_to do |format|
      if @travel_request.update(travel_request_params)
        @c1 = (@travel_request.to - @travel_request.traveling_date).to_i
        TravelRequest.where(id: @travel_request.id).update_all(day: @c1)
        # TravelRequestMailer.travel_request(@travel_request).deliver_now
        format.html { redirect_to @travel_request, notice: 'Travel request was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_request }
      else
        format.html { render :edit }
        format.json { render json: @travel_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_requests/1
  # DELETE /travel_requests/1.json
  def destroy
    @travel_request.destroy
    respond_to do |format|
      format.html { redirect_to travel_requests_url, notice: 'Travel request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def travel_request_confirmation
      @travel_request = TravelRequest.find(params[:format])
      @travel_requests = TravelRequest.where(id: @travel_request.id)
  end

  def cancel_travel_request
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Cancelled",reporting_master_id: current_user.employee_id)
    TravelRequestHistory.create(employee_id: @travel_request.employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Cancelled")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: current_user.employee_id, travel_status: "Cancelled")
    flash[:notice] = 'Travel Request Cancelled'
    redirect_to travel_requests_path
  end

  def first_approve
    @travel_request = TravelRequest.find(params[:format])
    first_manager_id = @travel_request.employee.manager_id
    second_manager_id = @travel_request.employee.manager_2_id
    @travel_request.update(current_status: "FirstApproved",reporting_master_id: second_manager_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: current_user.employee_id,travel_status: "FirstApproved")
    flash[:notice] = 'Travel Request Approved Successfully'
    redirect_to travel_history_travel_requests_path
  end

  # def approve_and_send_next
  #   @travel_request = TravelRequest.find(params[:format])
  #   employee = Employee.find_by(id: @travel_request.reporting_master_id)
  #   first_manager_id = employee.manager_id
  #   @travel_request.update(reporting_master_id: first_manager_id,current_status: "Approved & Send Next")
  #   ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: first_manager_id,travel_status: "Approved & Send Next")
  #   flash[:notice] = 'Travel Request Approved Successfully'
  #   redirect_to travel_history_travel_requests_path
  # end

  def reject
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "Rejected",reporting_master_id: current_user.employee_id)
    ReportingMastersTravelRequest.create(reporting_master_id: current_user.employee_id, travel_request_id: @travel_request.id,travel_status: "Rejected")
    flash[:alert] = 'Travel Request Rejected Successfully'
    redirect_to travel_history_travel_requests_path
  end

  def approve
     @travel_request = TravelRequest.find(params[:format])
     @travel_request.update(current_status: "Approved",reporting_master_id: current_user.employee_id)
     ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: current_user.employee_id,travel_status: "Approved")
     flash[:notice] = 'Travel Request Approved Successfully'
     redirect_to travel_history_travel_requests_path
  end

  def final_approval_travel_list
    @travel_requests = TravelRequest.where(current_status: "Approved")
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestprocess" 
  end

  def final_approve
    @travel_request = TravelRequest.find(params[:format])
    @travel_request.update(current_status: "FinalApproved",reporting_master_id: current_user.employee_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: current_user.employee_id,travel_status: "FinalApproved")
    flash[:notice] = 'Travel Request Approved Successfully'
    redirect_to travel_history_travel_requests_path
  end

  def daily_bill
    @travel_requests = TravelRequest.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
    
    session[:active_tab] ="EmployeeSelfService"  
  end

  def travel_history
    reporting_master_id = ReportingMaster.find_by(employee_id: current_user.employee_id)
    @travel_requests = TravelRequest.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",reporting_master_id.id,"Pending","FirstApproved","Approved & Send Next")
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestprocess" 
  end

  def travel_request_list
    @travel_requests = TravelRequest.where(employee_id: current_user.employee_id)
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestprocess" 
  end

  def is_confirm
    @travel_request = TravelRequest.find(params[:travel_id])
    @travel_request.update(is_confirm: true)
    flash[:notice] = "Confirmed !"
    redirect_to daily_bill_travel_requests_path
  end

  def travel_request_employee_name_report
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
  end

  def print_application_report 
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"

      @from = params[:salary] ? params[:salary][:from_date] : params[:from_date] 
      @to = params[:salary] ? params[:salary][:to_date] : params[:to_date]
      @company = params[:travel_request] ? params[:travel_request][:company_id] : params[:company_id] 
      @company_location = params[:travel_request] ?  params[:travel_request][:company_location_id] :  params[:company_location_id] 
      @department = params[:travel_request] ?  params[:travel_request][:department_id] : params[:department_id] 
      # @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      # @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      # @application_date = TravelRequest.where(employee_id: @employee_id).take

    if current_user.class == Group
      if @company == ""
        @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date)
      elsif @company_location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      elsif  @department == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
       else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
        @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date) 
        elsif @company_location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
        elsif  @department == ""
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      end
    elsif current_user.role.name == 'Admin'
         if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
           @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date).where(employee_id: @employees)
        elsif @company_location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @company_location.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(month:  @month,year: @year.to_s,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      end
    elsif current_user.role.name == 'Branch'
          if @company == "" || @company_location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
         elsif @department == ""
          @employees = Employee.where(company_location_id: @company_location.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
          else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
      end
    elsif current_user.role.name == 'HOD'
          if @company == "" || @company_location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(application_date:  @from.to_date..@to.to_date,employee_id: @employees)
        end
    elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
    end
    end
      respond_to do |format|
      format.js
      format.xls {render template: 'travel_requests/application_datewise_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'application_datewise_report_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'travel_requests/application_datewise_report_pdf.pdf.erb',
              # show_as_html: params[:debug].present?,
              :page_height      => 1000,
              :dpi              => '300',
              :margin           => {:top    => 10, # default 10 (mm)
                            :bottom => 10,
                            :left   => 20,
                            :right  => 20},
              :show_as_html => params[:debug].present?
          end
        end
 end

 def application_date_report
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
 end

 def travelling_datewise_report
     session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
 end

 def travel_request_id_report
   session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
 end

  def print_travelling_datewise_report
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
    # byebug
      @from = params[:salary] ? params[:salary][:from_date] : params[:from_date] 
      @to = params[:salary] ? params[:salary][:to_date] : params[:to_date]
      @company = params[:travel_request] ? params[:travel_request][:company_id] : params[:company_id] 
      @company_location = params[:travel_request] ?  params[:travel_request][:company_location_id] :  params[:company_location_id] 
      @department = params[:travel_request] ?  params[:travel_request][:department_id] : params[:department_id] 
      # @employees = Employee.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      # @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees) 
      # @traveling_date = TravelRequest.where(employee_id: @employee_id).take

      if current_user.class == Group
        if @company == ""
          @employees = Employee.where(status: 'Active').pluck(:id)
          @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
        elsif  @department == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          if @company == ""
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date) 
          elsif @company_location == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          elsif  @department == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          end

        elsif current_user.role.name == 'Admin'
          if @company == ""
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
             @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date).where(employee_id: @employees)
          elsif @company_location == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          elsif @department == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          end

        elsif current_user.role.name == 'Branch'
          if @company == "" || @company_location == ""
            @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          elsif @department == ""
            @employees = Employee.where(status: 'Active',company_location_id: @company_location.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          end
        elsif current_user.role.name == 'HOD'
          if @company == "" || @company_location == "" || @department == ""
            @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(traveling_date:  @from.to_date..@to.to_date,employee_id: @employees)
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      end
       respond_to do |format|
       format.js
       format.xls {render template: 'travel_requests/travelling_datewise_report_xls.xls.erb'}
       format.html
       format.pdf do
        render pdf: 'travelling_datewise_report_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'travel_requests/travelling_datewise_report_pdf.pdf.erb',
              # show_as_html: params[:debug].present?,
              :page_height      => 1000,
              :dpi              => '300',
              :margin           => {:top    => 10, # default 10 (mm)

                            :bottom => 10,
                            :left   => 20,
                            :right  => 20},
              :show_as_html => params[:debug].present?
          end
        end
    end

    def print_travel_request_id_report
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
      # byebug
      @travel_request =  params[:travel_request] ? params[:travel_request][:travel_request_id] : params[:travel_request_id]
      @travel_requests = TravelRequest.where(id: @travel_request)
      @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request)

     respond_to do |format|
     format.js
     format.xls {render template: 'travel_requests/travel_request_id_report_xls.xls.erb'}
     format.html
     format.pdf do
      render pdf: 'travel_request_id_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'travel_requests/travel_request_id_report_pdf.pdf.erb',
            # show_as_html: params[:debug].present?,
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
        end
      end
    end

    def print_travel_request_employee_name_report

    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"

      @employee_id = params[:travel_request] ? params[:travel_request][:employee_id] : params[:employee_id]
      @employee = Employee.find_by(id: @employee_id)
      @travel_requests = TravelRequest.where(employee_id: @employee_id)
      @travel_request = TravelRequest.where(employee_id: @employee_id).pluck(:id)
      @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request)
      @travel_expences = TravelExpence.where(travel_request_id: @travel_request)
      @travel_request_id = TravelRequest.where(employee_id: @employee_id).take
    
    respond_to do |format|
     format.js
     format.xls {render template: 'travel_requests/travel_request_employee_name_report_xls.xls.erb'}
     format.html
     format.pdf do
      render pdf: 'travel_request_employee_name_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'travel_requests/travel_request_employee_name_report_pdf.pdf.erb',
            # show_as_html: params[:debug].present?,
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_request
      @travel_request = TravelRequest.find(params[:id])
    end

    def travel_request_history_params
      params.require(:travel_request_history).permit(:status, :travel_request_id, :employee_id, :current_status,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :travel_option_id, :travel_mode_id, :total_advance)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_request_params
      params.require(:travel_request).permit(:employee_id, :to, :day,:current_status, :expense,:reporting_master_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :travel_option_id, :travel_mode_id, :total_advance)
    end
end