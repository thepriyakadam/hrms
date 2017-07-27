class VacancyMastersController < ApplicationController
  before_action :set_vacancy_master, only: [:show, :edit, :update, :destroy]

  # GET /vacancy_masters
  # GET /vacancy_masters.json   
  def index
    respond_to do |format|
    format.html
    format.csv { send_data @vacancy_masters.to_csv }
    format.xls
    if current_user.class == Group
      @vacancy_masters = VacancyMaster.all
      else
        if current_user.role.name == 'GroupAdmin'
          @vacancy_masters = VacancyMaster.all
        elsif current_user.role.name == 'Admin'
        @company_locations = CompanyLocation.where(company_id: current_user.company_location.company_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(company_location_id: @company_locations)
        elsif current_user.role.name == 'Branch'
        @vacancy_masters = VacancyMaster.where(company_location_id: current_user.company_location_id)
        elsif current_user.role.name == 'HOD'
        @vacancy_masters = VacancyMaster.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Recruitment'
          @vacancy_masters = VacancyMaster.all
      end
    end
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="particular_vacancy"
   end
  end

  def import
    VacancyMaster.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  # GET /vacancy_masters/1
  # GET /vacancy_masters/1.json@reporting_master = ReportingMaster.find(@vacancy_master.reporting_master_id)
    # @employee = Employee.find(@reporting_master.employee_id)

  def show
    # @reporting_master = ReportingMaster.find(@vacancy_master.reporting_master_id)
    # @employee = Employee.find(@reporting_master.employee_id)
  end

  # GET /vacancy_masters/new
  def new
    @vacancy_master = VacancyMaster.new
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="particular_vacancy"
  end

  # GET /vacancy_masters/1/edit
  def edit
  end

  # POST /vacancy_masters
  # POST /vacancy_masters.json
  

  def create
    @vacancy_master = VacancyMaster.new(vacancy_master_params)
    a=current_user.employee_id
    employee = Employee.where(id: a).take
    # if @vacancy_master.is_there?
    #   flash[:alert] = "Your Request already has been sent"
    #   redirect_to new_vacancy_master_path
    #  else
    if employee.try(:manager_id).nil?
        flash[:alert] = "Reporting Manager not set please set Reporting Manager"
        redirect_to new_vacancy_master_path
      else
        @vacancy_master.current_status = "Pending"
        @vacancy_master.reporting_master_id = employee.manager_id
        respond_to do |format|
      if @vacancy_master.save
        dept_id = params[:employee][:department_id]
        location = params[:employee][:company_location_id]
        company = params[:vacancy_master][:company_id]
        VacancyMaster.where(id: @vacancy_master.id).update_all(company_id: company,company_location_id: location,department_id: dept_id)
        ReportingMastersVacancyMaster.create(reporting_master_id: current_user.employee_id, vacancy_master_id: @vacancy_master.id,vacancy_status: "Pending")
        for i in 1..@vacancy_master.no_of_position.to_i
          ParticularVacancyRequest.create(vacancy_master_id: @vacancy_master.id, employee_id: @vacancy_master.employee_id, open_date: @vacancy_master.vacancy_post_date, fulfillment_date: @vacancy_master.vacancy_fullfillment_date,status: "Pending", employee_designation_id: @vacancy_master.employee_designation_id, vacancy_name: @vacancy_master.vacancy_name)
        end
        # client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
        # client.account.sms.messages.create(
        #   from: TWILIO_CONFIG['from'],
        #   to: @vacancy_master.description,
        #   body: "@vacancy_master.id"
        # )


      #   byebug
      #   emp=Employee.where(id: current_user.employee_id).take

      #   message = client.account.messages.create(
      #   :from => TWILIO_CONFIG['from'],
      #   :to => emp.contact_no,
      #   :body => @vacancy_master.id,
      #   # US phone numbers can make use of an image as well.
      #   # :media_url => image_url 
      # )
      # puts message.to
      
        # ReportingMastersVacancyMaster.create(reporting_master_id: @vacancy_master.reporting_master_id, vacancy_master_id: @vacancy_master.id)
        # VacancyRequestHistory.create(vacancy_master_id: @vacancy_master.id, vacancy_name: @vacancy_master.vacancy_name,no_of_position: @vacancy_master.no_of_position,description: @vacancy_master.description,vacancy_post_date: @vacancy_master.vacancy_post_date,budget: @vacancy_master.budget,department_id: @vacancy_master.department_id,employee_designation_id: @vacancy_master.employee_designation_id,company_location_id: @vacancy_master.company_location_id,degree_id: @vacancy_master.degree_id,degree_1_id: @vacancy_master.degree_1_id,degree_2_id: @vacancy_master.degree_2_id,experience: @vacancy_master.experience,keyword: @vacancy_master.keyword,other_organization: @vacancy_master.other_organization,industry: @vacancy_master.industry,reporting_master_id: @vacancy_master.reporting_master_id,current_status: @vacancy_master.current_status,employee_id: @vacancy_master.employee_id,justification: @vacancy_master.justification)
        # VacancyMasterMailer.vacancy_request(@vacancy_master).deliver_now
        format.html { redirect_to @vacancy_master, notice: 'Vacancy Created Successfully.' }
        format.json { render :show, status: :created, location: @vacancy_master }
      else
        format.html { render :new }
        format.json { render json: @vacancy_master.errors, status: :unprocessable_entity }
      end
    end
  end
end
# end

  # PATCH/PUT /vacancy_masters/1
  # PATCH/PUT /vacancy_masters/1.json
  def update
    respond_to do |format|
      if @vacancy_master.update(vacancy_master_params)
         
        VacancyMasterMailer.vacancy_request(@vacancy_master).deliver_now
        format.html { redirect_to @vacancy_master, notice: 'Vacancy Updated Successfully .' }
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
      format.html { redirect_to vacancy_masters_url, notice: 'Vacancy Destroyed Successfully' }
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
     # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     @vacancy_master = VacancyMaster.find(params[:format])
     @vacancy_masters = VacancyMaster.where(employee_id: @vacancy_master.employee_id)
  end

  def vacancy_history
    @vacancy_masters = VacancyMaster.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",current_user.employee_id,"Pending","FirstApproved","Approved & Send Next")
    
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="particular_vacancy"
  end 

  def modal
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def modal1
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def send_request_to_higher_authority
    @vacancy_master = VacancyMaster.find(params[:id])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
      @particular_vacancy_requests.each do |p|
        p.update(status: "Approved & Send Next")
      end 
    VacancyMasterMailer.approve_and_send_next_email(@vacancy_master).deliver_now
    @vacancy_master.update(current_status: "Approved & Send Next",reporting_master_id: params[:vacancy_master][:reporting_master_id])
    VacancyRequestHistory.create(vacancy_master_id: @vacancy_master.id, vacancy_name: @vacancy_master.vacancy_name,no_of_position: @vacancy_master.no_of_position,description: @vacancy_master.description,vacancy_post_date: @vacancy_master.vacancy_post_date,budget: @vacancy_master.budget,department_id: @vacancy_master.department_id,employee_designation_id: @vacancy_master.employee_designation_id,company_location_id: @vacancy_master.company_location_id,degree_id: @vacancy_master.degree_id,degree_1_id: @vacancy_master.degree_1_id,degree_2_id: @vacancy_master.degree_2_id,experience: @vacancy_master.experience,keyword: @vacancy_master.keyword,other_organization: @vacancy_master.other_organization,industry: @vacancy_master.industry,reporting_master_id: @vacancy_master.reporting_master_id,current_status: @vacancy_master.current_status,employee_id: @vacancy_master.employee_id,justification: @vacancy_master.justification)
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: params[:vacancy_master][:reporting_master_id])
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    ReportingMastersVacancyMaster.where(reporting_master_id: @reporting_masters,vacancy_master_id: @vacancy_master.id).update_all(vacancy_status: "Approved & Send Next")
    flash[:notice] = 'Vacancy Send to Higher Authority for Approval'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def first_approve
    @vacancy_master = VacancyMaster.find(params[:format])
    employee = Employee.find_by(id: @vacancy_master.employee_id)
    first_manager_id = employee.manager_id 
    second_manager_id = employee.manager_2_id 
    @vacancy_master.update(reporting_master_id: second_manager_id,current_status: "FirstApproved")
    ReportingMastersVacancyMaster.create(reporting_master_id: current_user.employee_id, vacancy_master_id: @vacancy_master.id,vacancy_status: "FirstApproved")
    flash[:notice] = 'Vacancy Request Approved Successfully'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def approve_vacancy
     @vacancy_master = VacancyMaster.find(params[:format])
     @vacancy_master.update(current_status: "Approved")
     ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id,reporting_master_id: current_user.employee_id,vacancy_status: "Approved")
     flash[:notice] = 'Vacancy Request Approved Successfully'
     redirect_to vacancy_history_vacancy_masters_path
  end

  def reject_vacancy
    @vacancy_master = VacancyMaster.find(params[:format])
    @vacancy_master.update(current_status: "Rejected",reporting_master_id: current_user.employee_id)
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id,reporting_master_id: current_user.employee_id,vacancy_status: "Rejected")
    flash[:alert] = 'Vacancy Request Rejected'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def approve_and_send_next
    @vacancy_master = VacancyMaster.find(params[:format])
    reporting_master = @vacancy_master.reporting_master_id
    employee = Employee.where(id: reporting_master).take
    first_manager_id = employee.manager_id
    @vacancy_master.update(reporting_master_id: first_manager_id,current_status: "Approved & Send Next")
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id,reporting_master_id: current_user.employee_id,vacancy_status: "Approved & Send Next")
    flash[:notice] = 'Vacancy Request Sent to Higher Authority for Approval'
    redirect_to vacancy_history_vacancy_masters_path
  end

  def final_approval_vacancy_list
     @vacancy_masters = VacancyMaster.where(current_status: "Approved")
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="particular_vacancy"
  end

  def final_approve
    @vacancy_master = VacancyMaster.find(params[:format])
    @vacancy_master.update(current_status: "FinalApproved",reporting_master_id: current_user.employee_id)
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id,reporting_master_id: current_user.employee_id,vacancy_status: "FinalApproved")
    ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id).update_all(status: "FinalApproved")
    flash[:notice] = 'Vacancy Request Approved Successfully'
    redirect_to final_approval_vacancy_list_vacancy_masters_path
  end

  def approve_vacancy_list
    @vacancy_masters = VacancyMaster.order("id")
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="particular_vacancy"
  end

  def cancel_vacancy_request
    @vacancy_master = VacancyMaster.find(params[:format])
    len = @vacancy_master.no_of_position
    @vacancy_master.update(current_status: "Cancelled")
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: @vacancy_master.reporting_master_id, vacancy_status: "Cancelled")
    VacancyRequestHistory.create(vacancy_master_id: @vacancy_master.id, vacancy_name: @vacancy_master.vacancy_name,no_of_position: @vacancy_master.no_of_position,description: @vacancy_master.description,vacancy_post_date: @vacancy_master.vacancy_post_date,budget: @vacancy_master.budget,department_id: @vacancy_master.department_id,employee_designation_id: @vacancy_master.employee_designation_id,company_location_id: @vacancy_master.company_location_id,degree_id: @vacancy_master.degree_id,degree_1_id: @vacancy_master.degree_1_id,degree_2_id: @vacancy_master.degree_2_id,experience: @vacancy_master.experience,keyword: @vacancy_master.keyword,other_organization: @vacancy_master.other_organization,industry: @vacancy_master.industry,reporting_master_id: @vacancy_master.reporting_master_id,current_status: @vacancy_master.current_status,employee_id: @vacancy_master.employee_id,justification: @vacancy_master.justification)
    if @vacancy_master.employee.email.nil?
      flash[:alert] = 'Vacancy Request Cancelled Without Email'
      redirect_to vacancy_masters_path
    else
      VacancyMasterMailer.cancel_vacancy_email(@vacancy_master).deliver_now
      flash[:notice] = 'Vacancy Request Cancelled & Email also Sent.'
      redirect_to vacancy_masters_path
    end
  end

  def particular_vacancy_request_list
    @vacancy_master = VacancyMaster.find(params[:format])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
    session[:active_tab] ="recruitment"
  end

  def particular_vacancy_request_list_history
    @vacancy_master = VacancyMaster.find(params[:format])
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id)
    session[:active_tab] ="recruitment"
  end

  def approved_vacancy_list
      @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
     # @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "Approved")
     session[:active_tab] ="recruitment"
    session[:active_tab1] ="particular_vacancy"
  end

  def is_closed
      @particular_vacancy_request =  ParticularVacancyRequest.find(params[:format])
      @particular_vacancy_request.update(is_complete: true)
      @selected_resume = SelectedResume.where(vacancy_master_id: @particular_vacancy_request.vacancy_master_id).take
      @interview_schedule = InterviewSchedule.where(selected_resume_id: @selected_resume.id).take
      @vacancy_master = VacancyMaster.where(id: @particular_vacancy_request.vacancy_master_id).take
      InterviewSchedule.where(id: @interview_schedule.id).update_all(is_confirmed: true)
      
      @particular_vacancy_request_1 = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,is_complete: true).count
      @particular_vacancy_request_2 = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,is_complete: nil).count
       if @interview_rounds_2 == 0 && @interview_rounds_1 > 0
          VacancyMaster.where(id: @vacancy_master.id).update_all(is_confirmed: true)
       else
       end

      flash[:notice] = "Vacancy Request Closed Successfully"
      redirect_to vacancy_masters_path
  end

  def vacancy_resume
      # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
      # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")

      if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
      session[:active_tab] ="recruitment"
      session[:active_tab1] ="interview_sched"
  end

  def vacancy_profile
    # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
    # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")

    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="interview_sched"
  end

  
  def modal2  
    puts "--------------------"
    @particular_vacancy_request = ParticularVacancyRequest.find(params[:format])
  end

  def confirm_candidate
      puts "-----------------"
      @particular_vacancy_request = ParticularVacancyRequest.find(params[:id])
      @candidate_name = params[:particular_vacancy_request][:candidate_name]
      @particular_vacancy_request.update(closed_date: Time.zone.now.to_date,is_complete: true,candidate_name: @candidate_name)
      flash[:notice] = "Candidate Confirmed & Vacancy Closed Successfully"
      redirect_to approved_vacancy_request_history_list_vacancy_masters_path
  end

  def confirm_interview_schedule_list
     @interview_schedules = InterviewSchedule.where(is_confirm: true)
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="interview_sched"
  end

  def confirm_vacancy
    @interview_schedule = InterviewSchedule.find(params[:format])
    @selected_resume = SelectedResume.where(id: @interview_schedule.selected_resume_id).take
    @vacancy_master = VacancyMaster.where(id: @selected_resume.vacancy_master_id).take
    @interview_analyses = InterviewAnalysis.where(interview_schedule_id: @interview_schedule.id)
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  def confirm_candidate_1
     @interview_schedule = InterviewSchedule.find(params[:format])
     InterviewSchedule.where(id: @interview_schedule.id).update_all(is_confirmed: true)
     @selected_resume = SelectedResume.where(id: @interview_schedule.selected_resume_id).take
     @vacancy_master = VacancyMaster.where(id: @selected_resume.vacancy_master_id).take
     a=ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,is_complete: nil).first
     ParticularVacancyRequest.where(id: a.id).update_all(is_complete: true,candidate_name: @interview_schedule.candidate_name,closed_date: Time.zone.now.to_date)

     @particular_vacancy_request_1 = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,is_complete: true).count
     @particular_vacancy_request_2 = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,is_complete: nil).count
       if @particular_vacancy_request_2 == 0 && @particular_vacancy_request_1 > 0
          VacancyMaster.where(id: @vacancy_master.id).update_all(is_confirmed: true)
       else
       end
     flash[:notice] = "Candidate Confirmed & Vacancy Closed Successfully"
    redirect_to confirm_interview_schedule_list_vacancy_masters_path
  end

  def modal3
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  # def update_vacancy_details
  #    @vacancy_master = VacancyMaster.find(params[:id])
  #    @vacancy_master.update(vacancy_master_params)
  #    # @vacancy_request_history = VacancyRequestHistory.new(vacancy_request_history_params)
  #    # @vacancy_request_history.save
  #    VacancyRequestHistory.create(vacancy_master_id: @vacancy_master.id, vacancy_name: @vacancy_master.vacancy_name,no_of_position: @vacancy_master.no_of_position,description: @vacancy_master.description,vacancy_post_date: @vacancy_master.vacancy_post_date,budget: @vacancy_master.budget,department_id: @vacancy_master.department_id,employee_designation_id: @vacancy_master.employee_designation_id,company_location_id: @vacancy_master.company_location_id,degree_id: @vacancy_master.degree_id,degree_1_id: @vacancy_master.degree_1_id,degree_2_id: @vacancy_master.degree_2_id,keyword: @vacancy_master.keyword,other_organization: @vacancy_master.other_organization,industry: @vacancy_master.industry,reporting_master_id: @vacancy_master.reporting_master_id,current_status: @vacancy_master.current_status,employee_id: @vacancy_master.employee_id,justification: @vacancy_master.justification,current_status: "Edit And Approved")
  #    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: @vacancy_master.reporting_master_id, vacancy_status: "Edit And Approved")
  #    flash[:notice] = "Vacancy Details Edited & Approved Successfully"
  #    redirect_to vacancy_history_vacancy_masters_path
  # end

  def update_vacancy_details
    # byebug
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @vacancy_request_history = VacancyRequestHistory.new   
    @vacancy_master = VacancyMaster.find(params[:vacancy_request_history][:vacancy_master_id])
    
    @vacancy_request_history.employee_designation_id = @vacancy_master.employee_designation_id
    @vacancy_request_history.justification = @vacancy_master.justification
    @vacancy_request_history.employee_id = @vacancy_master.employee_id
    @vacancy_request_history.current_status = @vacancy_master.current_status
    @vacancy_request_history.experience = @vacancy_master.experience
    @vacancy_request_history.degree_1_id = @vacancy_master.degree_1_id
    @vacancy_request_history.degree_2_id = @vacancy_master.degree_2_id
    @vacancy_request_history.reporting_master_id = @vacancy_master.reporting_master_id
    @vacancy_request_history.keyword = @vacancy_master.keyword
    @vacancy_request_history.other_organization = @vacancy_master.other_organization
    @vacancy_request_history.department_id = @vacancy_master.department_id
    @vacancy_request_history.degree_id = @vacancy_master.degree_id
    @vacancy_request_history.company_location_id = @vacancy_master.company_location_id
    @vacancy_request_history.vacancy_name = @vacancy_master.vacancy_name
    @vacancy_request_history.no_of_position = @vacancy_master.no_of_position
    @vacancy_request_history.description = @vacancy_master.description
    @vacancy_request_history.vacancy_post_date = @vacancy_master.vacancy_post_date
    @vacancy_request_history.budget = @vacancy_master.budget
    @vacancy_request_history.vacancy_master_id = @vacancy_master.id
    
    @vacancy_request_history.save
    # byebug
    @vacancy_master.update(employee_designation_id: params[:vacancy_request_history][:employee_designation_id], justification: params[:vacancy_request_history][:justification],employee_id: params[:vacancy_request_history][:employee_id],experience: params[:vacancy_request_history][:experience],degree_1_id: params[:vacancy_request_history][:degree_1_id],degree_2_id: params[:vacancy_request_history][:degree_2_id],reporting_master_id: params[:vacancy_request_history][:reporting_master_id],keyword: params[:vacancy_request_history][:keyword],other_organization: params[:vacancy_request_history][:other_organization],department_id: params[:vacancy_request_history][:department_id],degree_id: params[:vacancy_request_history][:degree_id],company_location_id: params[:vacancy_request_history][:company_location_id],vacancy_name: params[:vacancy_request_history][:vacancy_name],no_of_position: params[:vacancy_request_history][:no_of_position],description: params[:vacancy_request_history][:description],vacancy_post_date: params[:vacancy_request_history][:vacancy_post_date],budget: params[:vacancy_request_history][:budget],current_status: "Edit And Approved")
    @vacancy_request_history = VacancyRequestHistory.new(vacancy_request_history_params)
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id, reporting_master_id: @vacancy_master.reporting_master_id, vacancy_status: "Edit And Approved")
    redirect_to vacancy_history_vacancy_masters_path
    flash[:notice] = 'Vacancy Details Edited & Approved Successfully'
  end


  def approved_vacancy_request_history_list
    
     # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")

     if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
     session[:active_tab] ="recruitment"
    session[:active_tab1] ="interview_sched"
  end

  def vacancy_history_list
     @vacancy_master = VacancyMaster.find(params[:id])
     @vacancy_request_histories = VacancyRequestHistory.where(vacancy_master_id: @vacancy_master.id)
  end

  def show_vacancy_request_history
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @vacancy_request_history = VacancyRequestHistory.find(params[:format])
    @vacancy_request_histories = VacancyRequestHistory.where(id: @vacancy_request_history.id)
    @reporting_master = ReportingMaster.find(@vacancy_request_history.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
  end

  def reporting_masters_vacancy_master_list
    # @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @vacancy_master = VacancyMaster.find(params[:format])
    # @reporting_master = ReportingMaster.find(@vacancy_master.reporting_master_id)
    # @employee = Employee.find(@reporting_master.employee_id)
    # @vacancy_master1 = VacancyMaster.where(id: @vacancy_master.id)
    @reporting_masters_vacancy_masters = ReportingMastersVacancyMaster.where(vacancy_master_id: @vacancy_master.id)
    # @reporting_masters_vacancy_masters = ReportingMastersVacancyMaster.where(vacancy_master_id: @vacancy_master.id).order("id ASC")
  end

  def vac_history
     @vacancy_masters = VacancyMaster.group(:employee_id)
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="particular_vacancy"
  end

  def current_employee_vacancy_list
     @vacancy_master = params[:emp_id]
     @vacancy_masters = VacancyMaster.where(employee_id: @vacancy_master)
  end

  def show_vacancy_master_reporting_master_list
  end

  def vacancy_hr_resume
    # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
    @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved",recruiter_id: current_user.employee_id)
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="interview_sched"
  end

  def hr_resume
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id,status: "Shortlisted")
  end

  # def vacancy_hr_resume
  #     # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
  #     # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")

  #     if current_user.class == Member
  #     if current_user.role.name == 'GroupAdmin'
  #       @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
  #     elsif current_user.role.name == 'Admin'
  #       @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
  #       # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
  #       @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
  #     elsif current_user.role.name == 'Branch'
  #       @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
  #       @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
  #     elsif current_user.role.name == 'HOD'
  #       @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
  #       @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
  #     elsif current_user.role.name == 'Supervisor'
  #       @emp = Employee.find(current_user.employee_id)
  #       @employees = @emp.subordinates
  #       @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
  #     else current_user.role.name == 'Employee'
  #       @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
  #       redirect_to home_index_path
  #     end
  #   else
  #     @employees = Employee.all
  #   end
  #     session[:active_tab] ="recruitment"
  #     session[:active_tab1] ="interview_sched"
  # end

  # def hr_resume
  #   @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  #   @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id,status: "Shortlisted",)
  # end
  

  def vacancy_shortlisted_list
      # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ? or current_status = ?)",current_user.employee_id,"Approved","Edit And Approved")
      # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")

      if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        # @vacancy_masters = VacancyMaster.where("employee_id = ? and (current_status = ?)",current_user.employee_id,"FinalApproved")
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
      session[:active_tab] ="recruitment"
      session[:active_tab1] ="interview_sched"
  end

  def shortlisted_resume
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id,status: "Shortlisted",shortlist_for_interview: true)
  end

  def shortlist_for_interview
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resume_ids = params[:selected_resume_ids]
    if @selected_resume_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to hr_resume_vacancy_masters_path(vacancy_master_id: @vacancy_master.id)
    else
      @selected_resume_ids.each do |eid|
      @selected_resume = SelectedResume.find(eid)
      @selected_resume.update(shortlist_for_interview: true) 
      flash[:notice] = "Candidates Shortlisted For Interview"
    end 
     redirect_to hr_resume_vacancy_masters_path(vacancy_master_id: @vacancy_master.id)
   end
  end

  def show_selected_resume
    @selected_resume = SelectedResume.find(params[:id])
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_scheduled_resume
    @selected_resume = SelectedResume.find(params[:id])
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_vacancy_resume
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_vacancy_hr_resume
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_vacancy_shortlisted_list
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_vacancy_profile
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end
  
  def show_refferal
     @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def show_internal
     @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def modal_show_vacancy_page
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def refferal
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end

  def internal
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @vacancy_masters = VacancyMaster.where(employee_id: @employees,current_status: "FinalApproved")
      elsif current_user.role.name == 'Recruitment'
        @vacancy_masters = VacancyMaster.where(current_status: "FinalApproved")
      else current_user.role.name == 'Employee'
        @vacancy_masters = VacancyMaster.where(employee_id: current_user.employee_id,current_status: "FinalApproved")
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vacancy_master
    @vacancy_master = VacancyMaster.find(params[:id])
  end

  def vacancy_request_history_params
    params.require(:vacancy_request_history).permit(:vacancy_master_id,:employee_designation_id,:justification,:employee_id,:current_status,:experience,:degree_1_id,:degree_2_id,:reporting_master_id,:keyword,:other_organization, :department_id, :degree_id, :company_location_id, :vacancy_name, :no_of_position, :description, :vacancy_post_date, :budget)
  end

  # Never trust param eters from the scary internet, only allow the white list through.
  def vacancy_master_params
    params.require(:vacancy_master).permit(:vacancy_of,:target_date,:recruiter_id,:company_id,:vacancy_type,:employee_designation_id,:justification,:employee_id,:vacancy_code,:vacancy_fullfillment_date,:is_confirmed,:current_status,:experience,:experince_max,:degree_1_id,:degree_2_id,:reporting_master_id,:keyword,:other_organization, :department_id, :degree_id, :company_location_id, :vacancy_name, :no_of_position, :description, :vacancy_post_date, :budget,:budget_max,:reason,:replacement_id,:notice_period,:notice_period_day,:relocation_rerimbursement,:relocation_cost)
  end
end