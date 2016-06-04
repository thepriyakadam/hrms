class InductionActivitiesController < ApplicationController
  before_action :set_induction_activity, only: [:show, :edit, :update, :destroy]

  # GET /induction_activities
  # GET /induction_activities.json
  def index
    @induction_activities = InductionActivity.all
  end

  # GET /induction_activities/1
  # GET /induction_activities/1.json
  def show
  end

  # GET /induction_activities/new
  def new
    @induction_activity = InductionActivity.new
    @induction_master = InductionMaster.find(params[:format])
    @induction_activities = InductionActivity.where(induction_master_id: @induction_master.id)
  end


  # GET /induction_activities/1/edit
  def edit
  end

  # POST /induction_activities
  # POST /induction_activities.json

  #  def create
  #   @induction_activity = InductionActivity.new(induction_activity_params)
  #   @induction_activities = InductionActivity.all
  #   respond_to do |format|
  #      if @induction_activity.save
  #        @induction_activity = InductionActivity.new
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Induction Activity Already Exist.'
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  def create
     @induction_activity = InductionActivity.new(induction_activity_params)
     @induction_activities = InductionActivity.all
      if @induction_activity.save
        @induction_activity = InductionActivity.new
        flash[:notice] = 'Induction Activity saved Successfully.'
      end
      redirect_to root_url
  end

   def update
    @induction_activity.update(induction_activity_params)
    @induction_activities = InductionActivity.all
    @induction_activity = InductionActivity.new
  end

  def destroy
    @induction_activity.destroy
    @induction_activities = InductionActivity.all
  end

  def employee_list
     @employees = Employee.all
     session[:active_tab] ="employeemanagement"
     session[:active_tab1] ="employeeinduction"
  end

  def search_template
     @employee = Employee.find(params[:format])
  end

  # def find_assigned_induction_template
  #   @employee_id = params[:employee_id]
  # #   if params[:id] == ''
  # #     @flag = false
  # #   else
  #   @induction_master = InductionMaster.find_by_code(params[:code])
  #   @induction_activities = InductionActivity.where(induction_master_id: @induction_master.id)
  #   @induction_details = InductionDetail.where(induction_master_id: @induction_master.id)
  # end

  # def assign_new_template
  #   @employee_id = params[:employee_id]
  #   if params[:id] == ''
  #     @flag = false
  #   else
  #     @induction_master = InductionMaster.find_by_code(params[:code])
  #     unless InductionMaster.exists?(code: @induction_master.id)
  #       @flag = true
  #     end
  #   end
  # end

   def find_assigned_induction_template
       @employee = Employee.find(params[:employee_id])
       @induction_master = InductionMaster.find(params[:id])
       @induction_activities = InductionActivity.where(induction_master_id: @induction_master.id)
       @induction_details = InductionDetail.where(induction_master_id: @induction_master.id)
  end

  def download_document
    @induction_activity = InductionActivity.find(params[:id])
    send_file @induction_activity.avatar.path,
              filename: @induction_activity.avatar_file_name,
              type: @induction_activity.avatar_content_type,
              disposition: 'attachment'
  end

  def induction_activity
    
    @induction_activity = InductionActivity.find(params[:format])
    # @induction_act

  end

  # def induction_activity_download_list

  #    @induction_activities = InductionActivity.all

  # end

  def create_induction_detail
    @induction_master = InductionMaster.find(params[:id])
    @induction_det = params[:induction_detail][:start_date]
    @emp = params[:induction_detail][:employee_id]
    InductionDetail.create(start_date: @induction_det,employee_id: @emp,induction_master_id:@induction_master.id,induction_completed: :false)
    flash[:notice] = 'Induction Details was saved Successfully.'
    redirect_to employee_list_induction_activities_path
  end

  #  def send_email_to_candidate
  #   @interview_reschedule = InterviewReschedule.new
  #   @interview_schedule = InterviewSchedule.find(params[:interview_reschedule][:interview_schedule_id])

  #   @interview_reschedule.interview_date = @interview_schedule.interview_date
  #   @interview_reschedule.interview_time = @interview_schedule.interview_time
  #   @interview_reschedule.employee_id = @interview_schedule.employee_id
  #   @interview_reschedule.employee_id = params[:interview_reschedule][:employee_id]
  #   @interview_reschedule.interview_schedule_id = @interview_schedule.id

  #   @interview_reschedule.save
  #   @interview_schedule.update(interview_date: params[:interview_reschedule][:interview_date], interview_time: params[:interview_reschedule][:interview_time],employee_id: params[:interview_reschedule][:employee_id])
  #   if @interview_schedule.email_id.nil?
  #     flash[:alert] = 'Email not Available'
  #     redirect_to interview_schedules_path
  #   else
  #     InterviewScheduleMailer.sample_email_to_candidate(@interview_schedule).deliver_now
  #     flash[:notice] = 'Email Sent Successfully'
  #     redirect_to interview_schedules_path
  #     @interview_reschedule = InterviewReschedule.new(interview_reschedule_params)
  #   # @interview_reschedule.save
  #   end
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_activity
      @induction_activity = InductionActivity.find(params[:id])
    end

    def induction_detail_params
      params.require(:induction_detail).permit(:employee_id, :start_date, :induction_master_id, :induction_activity_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_activity_params
      params.require(:induction_activity).permit(:start_date,:is_confirmed,:avatar,:induction_master_id,:activity, :day, :duration, :employee_id, :induction_master_id)
    end
end
