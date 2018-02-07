class MeetingMinutesController < ApplicationController
  before_action :set_meeting_minute, only: [:show, :edit, :update, :destroy]

  # GET /meeting_minutes
  # GET /meeting_minutes.json
  def index
    @meeting_minutes = MeetingMinute.all
  end

  # GET /meeting_minutes/1
  # GET /meeting_minutes/1.json
  def show
  end

  # GET /meeting_minutes/new
  def new
    @meeting_minute = MeetingMinute.new
  end

  # GET /meeting_minutes/1/edit
  def edit
  end
  
  def view_minutes
    plan_id = params[:format]
    @meeting_minutes = MeetingMinute.where(employee_plan_id: plan_id)
    # binding.pry
  end

  def minutes_form
    @meeting_minute = MeetingMinute.new
  end
  
  # POST /meeting_minutes
  # POST /meeting_minutes.json
  def create
    plan_id = params[:meeting_minute][:employee_plan_id]
    @meeting_minute = MeetingMinute.new(meeting_minute_params)
    @emp_plan = EmployeePlan.where(id: plan_id, start_date: Time.now.to_date).first
    @emp_plan_first = EmployeePlan.where(id: plan_id)
    if @emp_plan.present?
      @emp_plan.update(start_time: Time.now.to_time, start_date: Time.now.to_date)
    else
      @emp_plan_first.update_all(start_time: Time.now.to_time, start_date: Time.now.to_date)
    end
    respond_to do |format|
      if @meeting_minute.save
        format.html { redirect_to employee_feedback_employee_plans_path(plan_id), notice: 'Meeting minute was successfully Added.' }
        format.json { render :show, status: :created, location: @meeting_minute }
      else
        format.html { render :new }
        format.json { render json: @meeting_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_minutes/1
  # PATCH/PUT /meeting_minutes/1.json
  def update
    respond_to do |format|
      if @meeting_minute.update(meeting_minute_params)
        format.html { redirect_to @meeting_minute, notice: 'Meeting minute was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_minute }
      else
        format.html { render :edit }
        format.json { render json: @meeting_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_minutes/1
  # DELETE /meeting_minutes/1.json
  def destroy
    @meeting_minute.destroy
    respond_to do |format|
      format.html { redirect_to meeting_minutes_url, notice: 'Meeting minute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_minute
      @meeting_minute = MeetingMinute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_minute_params
      params.require(:meeting_minute).permit(:employee_plan_id, :minutes)
    end
end
