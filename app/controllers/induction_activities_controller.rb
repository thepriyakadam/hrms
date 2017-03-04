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
    # byebug
    @induction_master = InductionMaster.find(params[:induction_master_id])
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
        time_diff=Time.at((@induction_activity.to-@induction_activity.from).round).utc.strftime "%H:%M"
        # final_time_diff_in_hrs=time_diff.to_time.strftime("%H").to_i + time_diff.to_time.strftime("%M").to_f/60
        InductionActivity.where(id: @induction_activity.id).update_all(duration: time_diff)
        @induction_activity = InductionActivity.new
        flash[:notice] = 'Induction Activity saved Successfully.'
      end
      @induction_master_id = InductionMaster.find(params[:induction_activity][:induction_master_id])
      redirect_to new_induction_activity_path(induction_master_id: @induction_master_id.id)
  end

   def update
    @induction_activity.update(induction_activity_params)
    @induction_activities = InductionActivity.all
    @induction_activity = InductionActivity.new
  end

  def destroy
    @induction_activity.destroy
    flash[:alert] = 'Activity Destroyed Successfully'
    redirect_to new_induction_activity_path(induction_master_id: params[:induction_master_id])
  end

  def employee_list
     # @employees = Employee.all
     @induction_details = InductionDetail.where(induction_completed: true).pluck(:employee_id)
     @employees = Employee.where.not(id: @induction_details)
     # @employee = Employee.find(params[:emp_id])
     # @induction_details = InductionDetail.where(employee_id: @employee.id)
     session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="EmployeeInduction"
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

  def search_template
     @employee = Employee.find(params[:format])
    # @induction_master = params[:id]
    # @induction_activities = InductionActivity.where(induction_master_id: @induction_master.id)
    # @induction_details = InductionDetail.where(induction_master_id: @induction_master.id)
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
  end

  def create_induction_detail
    # byebug
    @induction_master = InductionMaster.find(params[:id])
    # @induction_det = params[:induction_detail][:start_date]
    @emp = params[:induction_detail][:employee_id]
    # InductionDetail.create(start_date: @induction_det,employee_id: @emp,induction_master_id:@induction_master.id,induction_completed: false)
    InductionDetail.create(employee_id: @emp,induction_master_id: @induction_master.id,induction_completed: false)
    flash[:notice] = 'Induction Details was saved Successfully.'
    redirect_to employee_list_induction_activities_path
  end


  def modal_induction_activity
    #byebug
    @induction_activity = InductionActivity.find(params[:induction_activity_id])
    @induction_master = InductionMaster.find(params[:induction_master_id])
  end


  def update_induction
    @induction_activity = InductionActivity.find(params[:id])
    @induction_activity.update(induction_activity_params)
    time_diff=Time.at((@induction_activity.to-@induction_activity.from).round).utc.strftime "%H:%M"
    # final_time_diff_in_hrs=time_diff.to_time.strftime("%H").to_i + time_diff.to_time.strftime("%M").to_f/60
    InductionActivity.where(id: @induction_activity.id).update_all(duration: time_diff)
    @induction_master = InductionMaster.find(params[:induction_master_id])
    flash[:notice] = 'Activity Updated Successfully'
    redirect_to new_induction_activity_path(induction_master_id: @induction_master.id)
  end

  # def view_induction_list
  #    @employee = Employee.find(params[:emp_id])
  #    @induction_details = InductionDetail.where(employee_id: @employee.id,induction_completed: true)
  #    @induction_details_1 = InductionDetail.where(employee_id: @employee.id,induction_completed: true).pluck(:induction_master_id)
  #    @induction_activities = InductionActivity.where(induction_master_id: @induction_details_1)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_activity
      @induction_activity = InductionActivity.find(params[:id])
    end

    def induction_detail_params
      params.require(:induction_detail).permit(:activity_date,:from,:to,:start_date,:employee_id, :start_date, :induction_master_id, :induction_activity_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_activity_params
      params.require(:induction_activity).permit(:activity_date,:from,:to,:start_date,:program_agenda,:is_confirmed,:avatar,:induction_master_id,:activity, :day, :duration, :employee_id, :induction_master_id)
    end
end
