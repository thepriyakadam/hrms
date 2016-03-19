require 'query_report/helper'  #need to require the helper

class InterviewSchedulesController < ApplicationController
  before_action :set_interview_schedule, only: [:show, :edit, :update, :destroy]

  # GET /interview_schedules
  # GET /interview_schedules.json
  include QueryReport::Helper  #need to include it
  def index
    @interview_schedules = InterviewSchedule.all
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

  # DELETE /interview_schedules/1
  # DELETE /interview_schedules/1.json
  def destroy
    @interview_schedule.destroy
    respond_to do |format|
      format.html { redirect_to interview_schedules_url, notice: 'Interview schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_by_interview_date
    @interview_schedules=InterviewSchedule.all
    reporter(@interview_schedules) do
      filter :interview_date, type: :date
      column(:interviewer_name,sortable: true) { |interview_schedule| interview_schedule.interviewer_name }
      column(:candidate_name,sortable: true) { |interview_schedule| interview_schedule.candidate_name }
      column(:interview_date,sortable: true) { |interview_schedule| interview_schedule.interview_date }
      column(:interview_time,sortable: true) { |interview_schedule| interview_schedule.interview_time }
      column(:location,sortable: true) { |interview_schedule| interview_schedule.location }
      column(:schedule_comments,sortable: true) { |interview_schedule| interview_schedule.schedule_comments }
      column(:post_title,sortable: true) { |interview_schedule| interview_schedule.post_title }
      column(:interview_type,sortable: true) { |interview_schedule| interview_schedule.interview_type }
      column(:interview_status,sortable: true) { |interview_schedule| interview_schedule.interview_status }  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_schedule
      @interview_schedule = InterviewSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_schedule_params
      params.require(:interview_schedule).permit(:interviewer_name, :candidate_name, :interview_date, :interview_time, :location, :schedule_comments, :post_title, :interview_type, :interview_status)
    end
end
