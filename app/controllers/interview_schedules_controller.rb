require 'query_report/helper'  #need to require the helper

class InterviewSchedulesController < ApplicationController
  before_action :set_interview_schedule, only: [:show, :edit, :update, :destroy]

  # GET /interview_schedules
  # GET /interview_schedules.json
  include QueryReport::Helper  #need to include it
  def index
    @interview_schedules = InterviewSchedule.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@interview_schedules)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  # GET /interview_schedules/1
  # GET /interview_schedules/1.json
  def show
  end

  # GET /interview_schedules/new
  def new
    @interview_schedule = InterviewSchedule.new
  end

  # GET /interview_schedules/1/edit
  def edit
  end

  # POST /interview_schedules
  # POST /interview_schedules.json
  def create
    @interview_schedule = InterviewSchedule.new(interview_schedule_params)

    respond_to do |format|
      if @interview_schedule.save
        InterviewScheduleMailer.sample_email(@interview_schedule).deliver_now
        format.html { redirect_to @interview_schedule, notice: 'Interview schedule was successfully created.' }
        format.json { render :show, status: :created, location: @interview_schedule }
      else
        format.html { render :new }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_schedules/1
  # PATCH/PUT /interview_schedules/1.json
  def update
    respond_to do |format|
      if @interview_schedule.update(interview_schedule_params)
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
      @interview_reschedule.employee_id = params[:interview_reschedule][:employee_id]
      @interview_reschedule.interview_schedule_id = @interview_schedule.id

      @interview_reschedule.save
      @interview_schedule.update(interview_date: params[:interview_reschedule][:interview_date], interview_time: params[:interview_reschedule][:interview_time])
      if @interview_schedule.email_id.nil?
        flash[:alert] = "Email not Available"
        redirect_to interview_schedules_path
      else
      InterviewScheduleMailer.sample_email_to_candidate(@interview_schedule).deliver_now
      flash[:notice] = "Email Sent Successfully"
      redirect_to interview_schedules_path
      @interview_reschedule = InterviewReschedule.new(interview_reschedule_params)
      # @interview_reschedule.save
    end
  end

  def sample_email_to_interviewer
     @interview_schedule = InterviewSchedule.find_by_employee_id(params[:id])
     @employee= Employee.find(@interview_schedule.employee_id)
      if @employee.email.nil?
        flash[:alert] = "Email not Available"
        redirect_to interview_schedules_path
      else
     InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      flash[:notice] = "Email Sent Successfully"
      redirect_to interview_schedules_path
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
    @employee = Employee.find(params[:id])
    @interview_reschedule = InterviewReschedule.new
    @interview_schedule = InterviewSchedule.find_by_employee_id(params[:id])
  end



  def search_by_interview_date
    @interview_schedules=InterviewSchedule.all
    reporter(@interview_schedules,template_class: PdfReportTemplate) do
      filter :interview_date, type: :date
      column :interviewer_name,sortable: true
      column :candidate_name,sortable: true
      column :interview_date,sortable: true
      column :interview_time,sortable: true
      column :location,sortable: true
      column :schedule_comments,sortable: true
      column :post_title,sortable: true
      column :interview_type,sortable: true
      column :interview_status,sortable: true
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def interview_reschedule_params
      params.require(:interview_reschedule).permit(:interview_date, :interview_time,:interview_schedule_id,:employee_id)
    end

    def set_interview_schedule
      @interview_schedule = InterviewSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_schedule_params
      params.require(:interview_schedule).permit(:interviewer_name,:employee_id,:interview_schedule_id,:reporting_master_id,:email_id,:candidate_name, :interview_date, :interview_time, :location, :schedule_comments, :post_title, :interview_type, :interview_status)
    end
end
