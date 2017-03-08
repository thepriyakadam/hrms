require 'query_report/helper' # need to require the helper

class InterviewSchedulesController < ApplicationController
  before_action :set_interview_schedule, only: [:show, :edit, :update, :destroy]

  # GET /interview_schedules
  # GET /interview_schedules.json
  include QueryReport::Helper # need to include it
  def index
    @interview_schedules = InterviewSchedule.all
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@interview_schedules)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
    session[:active_tab] ="recruitment"
    session[:active_tab1] = "general_vacancy"
  end

  # GET /interview_schedules/1
  # GET /interview_schedules/1.json
  def show
  end

  # GET /interview_schedules/new
  def new
    @interview_schedule = InterviewSchedule.new
    @selected_resume = SelectedResume.find(params[:format])
  end

  def new1
    @interview_schedule = InterviewSchedule.new
    @selected_resume = SelectedResume.find(params[:format])
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="general_vacancy"
  end

  # GET /interview_schedules/1/edit
  def edit
    # @interview_schedule = InterviewSchedule.find(params[:format])
    # @selected_resume = SelectedResume.find(@interview_schedule.selected_resume_id)
    # @interview_schedules = InterviewSchedule.where(selected_resume_id: @selected_resume.id)
  end
  
  
  # POST /interview_schedules
  # POST /interview_schedules.json
  
  def create
   @interview_schedule = InterviewSchedule.new(interview_schedule_params)
    if @interview_schedule.save
     @selected_resume = SelectedResume.find(@interview_schedule.selected_resume_id)
     @selected_resume.update(status: "Interview Scheduled")
      InterviewScheduleMailer.sample_email(@interview_schedule).deliver_now
      @interview_schedule = InterviewSchedule.new
    end
    if @interview_schedule.email_id.nil?
      flash[:alert] = 'Interview Scheduled Successfully without Email'
      redirect_to interview_schedules_path
    else
      InterviewScheduleMailer.sample_email_to_candidate(@interview_schedule).deliver_now
      flash[:notice] = 'Interview Scheduled Successfully & Email also Sent.'
      redirect_to interview_schedules_path
    # @interview_reschedule.save
    end
  end

  def create_new
    @interview_schedule = InterviewSchedule.new(interview_schedule_params)
     # @interview_schedules = InterviewSchedule.all
      if @interview_schedule.save
        @selected_resume = SelectedResume.find(@interview_schedule.selected_resume_id)
        @selected_resume.update(status: "Interview Scheduled")
        # InterviewScheduleMailer.sample_email(@interview_schedule).deliver_now
        @interview_schedule = InterviewSchedule.new
      end
      if @interview_schedule.email_id.nil?
      flash[:notice] = 'Interview Scheduled Successfully without Email'
      redirect_to interview_schedules_path
       else
      # InterviewScheduleMailer.sample_email_to_candidate(@interview_schedule).deliver_now
      flash[:notice] = 'Interview Scheduled Successfully & Email also Sent.'
      redirect_to interview_schedules_path
    # @interview_reschedule.save
    end
  end

  # PATCH/PUT /interview_schedules/1
  # PATCH/PUT /interview_schedules/1.json
  def update
    respond_to do |format|
      if @interview_schedule.update(interview_schedule_params)
        InterviewScheduleMailer.sample_email(@interview_schedule).deliver_now
        format.html { redirect_to @interview_schedule, notice: 'Interview schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_schedule }
      else
        format.html { render :edit }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_email_to_candidate
    @interview_reschedule = InterviewReschedule.new
    @interview_schedule = InterviewSchedule.find(params[:interview_reschedule][:interview_schedule_id])

    @interview_reschedule.interview_date = @interview_schedule.interview_date
    @interview_reschedule.interview_time = @interview_schedule.interview_time
    @interview_reschedule.employee_id = @interview_schedule.employee_id
    @interview_reschedule.employee_id = params[:interview_reschedule][:employee_id]
    @interview_reschedule.interview_schedule_id = @interview_schedule.id

    @interview_reschedule.save
    @interview_schedule.update(interview_date: params[:interview_reschedule][:interview_date], interview_time: params[:interview_reschedule][:interview_time],employee_id: params[:interview_reschedule][:employee_id])
    if @interview_schedule.email_id.nil?
      flash[:alert] = 'Email not Available'
      redirect_to interview_schedules_path
    else
      InterviewScheduleMailer.sample_email_to_candidate(@interview_schedule).deliver_now
      flash[:notice] = 'Email Sent Successfully'
      redirect_to interview_schedules_path
      @interview_reschedule = InterviewReschedule.new(interview_reschedule_params)
    # @interview_reschedule.save
    end
  end

  def sample_email_to_interviewer
    @interview_schedule = InterviewSchedule.find_by_employee_id(params[:id])
    @employee = Employee.find(@interview_schedule.employee_id)
    if @employee.email.nil?
      flash[:alert] = 'Email not Available'
      redirect_to interview_schedules_path
    else
      # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      # InterviewScheduleMailer.confirmation_email_to_candidate(@interview_schedule).deliver_now
      flash[:notice] = 'Email Sent Successfully'
      redirect_to interview_schedules_path
  end
  end

  
  def sample_email
    @interview_schedule = InterviewSchedule.find_by_employee_id(params[:id])
    @employee = Employee.find(@interview_schedule.employee_id)
    date = Date.today
    @employees = Employee.where("strftime('%d/%m', date_of_birth) = ?", date.strftime('%d/%m'))
    if @employees.empty?
    else
    @employees.each do |e|
      InterviewScheduleMailer.sample_email(e).deliver_now
      redirect_to interview_schedules_path
    end
  end
end

  # DELETE /interview_schedules/1
  # DELETE /interview_schedules/1.json
  def destroy
    @interview_schedule.destroy
    respond_to do |format|
      format.html { redirect_to interview_schedules_url, notice: 'Interview schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal
  end

  def interview_reschedule
    # byebug
    @interview_schedule = InterviewSchedule.find(params[:id])
    @employee = Employee.find(@interview_schedule.employee_id)
    @interview_reschedule = InterviewReschedule.new
  end

  def interview_reschedule_list
     @interview_schedule = InterviewSchedule.find(params[:format])
     @interview_reschedules = InterviewReschedule.where(interview_schedule_id: @interview_schedule.id)
  end

  def is_confirm
    @interview_schedule_ids = params[:interview_schedule_ids]
    if @interview_schedule_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to interview_schedules_path
    else
      @interview_schedule_ids.each do |eid|
      @interview_schedule = InterviewSchedule.find(eid)
      @interview_schedule.update(is_confirm: true) 
      # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      InterviewScheduleMailer.confirmation_email_to_candidate(@interview_schedule).deliver_now     
      flash[:notice] = "Confirmed Successfully & Email also sent"
    end 
     redirect_to interview_schedules_path
  end
  end

  def interviewee_list
    @interview_schedules = InterviewSchedule.all
    session[:active_tab] = "recruitment"
    session[:active_tab1] = "general_vacancy"
  end

  def resume_list
     @selected_resume = SelectedResume.new
     # @interview_schedule = InterviewSchedule.find(params[:format])
     @interview_round = InterviewRound.find(params[:format])
     @interview_schedule = InterviewSchedule.where(id: @interview_round.interview_schedule_id).take
     # @selected_resumes = SelectedResume.where(id: @interview_schedule.selected_resume_id)
     @selected_resumes = SelectedResume.where(id: @interview_schedule.selected_resume_id)
  end

  def print_interviewee_list
    # byebug
    # @interview_schedule = InterviewSchedule.find(params[:format])
    @interview_schedule_ids = params[:interview_schedule_ids]
    @interview_schedules = InterviewSchedule.where(employee_id: current_user.employee_id,is_confirm: true)
     respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_interviewee_list',
        layout: '/layouts/pdf.html.erb',
        :template => 'interview_schedules/print_interviewee_list.pdf.erb',
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

  def all_interview_schedule_list
     @interview_schedules = InterviewSchedule.all
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="general_vacancy"
  end
 
  def final_report
    # byebug
    @interview_schedule = InterviewSchedule.find(params[:format])
    @interview_schedules = InterviewSchedule.where(id: @interview_schedule.id)
    @interview_analyses = InterviewAnalysis.where(interview_schedule_id: @interview_schedule.id)
    @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="general_vacancy"
  end

  def print_final_report
     puts "----------------------"
     # byebug
     @interview_schedule = InterviewSchedule.find(params[:id])
     @interview_schedules = InterviewSchedule.where(id: @interview_schedule.id)
     @interview_analyses = InterviewAnalysis.where(interview_schedule_id: @interview_schedule.id)
     @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
     respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_final_report',
        layout: '/layouts/pdf.html.erb',
        :template => 'interview_schedules/print_final_report.pdf.erb',
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

  def interview_round_list
    # @interview_schedule = InterviewSchedule.find(params[:format])
    @interview_rounds = InterviewRound.where(employee_id: current_user.employee_id)
    # @interview_rounds = InterviewRound.where(interview_schedule_id: @interview_schedule.id)
  end

  def modal_schedule_list
    @interview_schedule = InterviewSchedule.find(params[:format])
  end

   def update_interview_schedule
     @interview_schedule = InterviewSchedule.find(params[:id])
     @email_id = params[:interview_schedule][:email_id]
     @location = params[:interview_schedule][:location]
     @interview_date = params[:interview_schedule][:interview_date]
     @trainee.update(email_id: @email_id,location: @location,interview_date: @interview_date)
     flash[:notice] = 'Interview Details Updated Successfully'
     redirect_to interview_schedules_path
    end

  private

  # Use callbacks to share common setup or constraints between actions.
  def interview_reschedule_params
    params.require(:interview_reschedule).permit(:interview_date, :interview_time, :interview_schedule_id, :employee_id)
  end

  def set_interview_schedule
    @interview_schedule = InterviewSchedule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_schedule_params
    params.require(:interview_schedule).permit(:selected_resume_id, :employee_id, :address,:interview_schedule_id, :email_id, :candidate_name, :interview_date, :location, :job_title)
  end
end