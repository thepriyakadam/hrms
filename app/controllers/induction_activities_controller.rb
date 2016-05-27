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
    @induction_activities = InductionActivity.all
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

  def induction_activity_download_list

     

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_activity
      @induction_activity = InductionActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_activity_params
      params.require(:induction_activity).permit(:start_date,:is_confirmed,:avatar,:induction_master_id,:activity, :day, :duration, :employee_id, :induction_master_id)
    end
end
