class LeaveMastersController < ApplicationController
  before_action :set_leave_master, only: [:show, :edit, :update, :destroy]

  # GET /leave_masters
  # GET /leave_masters.json
  # def index
  #   @leave_masters = LeaveMaster.all
  # end

  # GET /leave_masters/1
  # GET /leave_masters/1.json
  

  # GET /leave_masters/new
  def new
    @leave_master = LeaveMaster.new
    @leave_masters = LeaveMaster.all
     session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="leaveadministration"
  end

  # GET /leave_masters/1/edit
  def edit
  end

  # POST /leave_masters
  # POST /leave_masters.json
  def create
    @leave_master = LeaveMaster.new(leave_master_params)
    @leave_masters = LeaveMaster.all

    respond_to do |format|
      if @leave_master.save
         @leave_master = LeaveMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Leave Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /leave_masters/1
  # PATCH/PUT /leave_masters/1.json
  def update
    @leave_master.update(leave_master_params)
    @leave_master = LeaveMaster.new
    @leave_masters = LeaveMaster.all
  end

  # DELETE /leave_masters/1
  # DELETE /leave_masters/1.json
  def destroy
    @leave_master.destroy
    @leave_masters = LeaveMaster.all
  end

  def modal_leave_master
    @leave_master = LeaveMaster.find(params[:format])
  end

  # def select_textbox
  #   if params[:is_carry_forward] == true
  #     @flag = true
  #   else
  #     @flag = false
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_master
      @leave_master = LeaveMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_master_params
      params.require(:leave_master).permit(:company_workingday,:leav_category_id, :period, :working_day, :no_of_leave, :is_carry_forward, :limit)
    end
end
