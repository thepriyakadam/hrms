class LeaveCashMastersController < ApplicationController
  before_action :set_leave_cash_master, only: [:show, :edit, :update, :destroy]

  # GET /leave_cash_masters
  # GET /leave_cash_masters.json
  def index
  end

  # GET /leave_cash_masters/1
  # GET /leave_cash_masters/1.json
  def show
  end

  # GET /leave_cash_masters/new
  def new
    @leave_cash_master = LeaveCashMaster.new
    @leave_cash_masters = LeaveCashMaster.all
    session[:active_tab] ="leavemanagement"
    session[:active_tab1] ="leaveadministration"
  end

  # GET /leave_cash_masters/1/edit
  def edit
  end

  # POST /leave_cash_masters
  # POST /leave_cash_masters.json
  def create
    components = params[:components]
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @leave_cash_master = LeaveCashMaster.new(leave_cash_master_params)
    @leave_cash_master.base_component = str
    @leave_cash_masters = LeaveCashMaster.all
    @leave_cash_master.save
    @leave_cash_master = LeaveCashMaster.new
  end

  # PATCH/PUT /leave_cash_masters/1
  # PATCH/PUT /leave_cash_masters/1.json
  def update
     components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @leave_cash_master.base_component = str
    @leave_cash_master.update(leave_cash_master_params)
    @leave_cash_masters = LeaveCashMaster.all
    @leave_cash_master = LeaveCashMaster.new
  end

  # DELETE /leave_cash_masters/1
  # DELETE /leave_cash_masters/1.json
  def destroy
    @leave_cash_master.destroy
    @leave_cash_masters = LeaveCashMaster.all  
  end

  def is_confirm
    @leave_cash_master = LeaveCashMaster.find(params[:leave_cash_master])
    LeaveCashMaster.find(@leave_cash_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_leave_cash_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_cash_master
      @leave_cash_master = LeaveCashMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_cash_master_params
      params.require(:leave_cash_master).permit(:base_component, :rate, :is_confirm, :is_active)
    end
end
