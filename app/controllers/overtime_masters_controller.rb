class OvertimeMastersController < ApplicationController
  before_action :set_overtime_master, only: [:show, :edit, :update, :destroy]

 
  def new
    @overtime_master = OvertimeMaster.new
    @overtime_masters = OvertimeMaster.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /overtime_masters/1/edit
  def edit
  end

  # POST /overtime_masters
  # POST /overtime_masters.json
  def create
    @overtime_master = OvertimeMaster.new(overtime_master_params)
    @overtime_masters = OvertimeMaster.all
    respond_to do |format|
      if @overtime_master.save
        @overtime_master = OvertimeMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Overtime Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /overtime_masters/1
  # PATCH/PUT /overtime_masters/1.json
  def update
    @overtime_master.update(overtime_master_params)
    @overtime_masters = OvertimeMaster.all
    @overtime_master = OvertimeMaster.new
  end

  # DELETE /overtime_masters/1
  # DELETE /overtime_masters/1.json
  def destroy
    @overtime_master.destroy
    @overtime_masters = OvertimeMaster.all
  end

  def is_confirm
    @overtime_master = OvertimeMaster.find(params[:overtime_master])
    OvertimeMaster.find(@overtime_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_overtime_master_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_overtime_master
    @overtime_master = OvertimeMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def overtime_master_params
    params.require(:overtime_master).permit(:is_confirm,:is_over_time, :day, :company_hrs, :ot_rate, :is_esic, :status)
  end
end
