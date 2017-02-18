class PayrollOvertimeMastersController < ApplicationController
  before_action :set_payroll_overtime_master, only: [:show, :edit, :update, :destroy]

  # GET /payroll_overtime_masters
  # GET /payroll_overtime_masters.json
  def index
   
  end

  # GET /payroll_overtime_masters/1
  # GET /payroll_overtime_masters/1.json
  def show
  end

  # GET /payroll_overtime_masters/new
  def new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
    @payroll_overtime_master = PayrollOvertimeMaster.new
    @payroll_overtime_masters = PayrollOvertimeMaster.all
  end

  # GET /payroll_overtime_masters/1/edit
  def edit
  end

  # POST /payroll_overtime_masters
  # POST /payroll_overtime_masters.json
  
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
    @payroll_overtime_master = PayrollOvertimeMaster.new(payroll_overtime_master_params)
    @payroll_overtime_master.base_component = str
    @payroll_overtime_masters = PayrollOvertimeMaster.all
    @payroll_overtime_master.save
    @payroll_overtime_master = PayrollOvertimeMaster.new
  end



  # PATCH/PUT /payroll_overtime_masters/1
  # PATCH/PUT /payroll_overtime_masters/1.json
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
    @payroll_overtime_master.base_component = str
    @payroll_overtime_master.update(payroll_overtime_master_params)
    @payroll_overtime_masters = PfEmployer.all
    @payroll_overtime_master = PfEmployer.new

  end


  # DELETE /payroll_overtime_masters/1
  # DELETE /payroll_overtime_masters/1.json
  def destroy
    @payroll_overtime_master.destroy
    @payroll_overtime_masters = PayrollOvertimeMaster.all
   
  end

  def is_confirm
    @payroll_overtime_master = PayrollOvertimeMaster.find(params[:payroll_overtime_master])
    PayrollOvertimeMaster.find(@payroll_overtime_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_payroll_overtime_master_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_overtime_master
      @payroll_overtime_master = PayrollOvertimeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_overtime_master_params
      params.require(:payroll_overtime_master).permit(:is_payroll, :base_component, :rate, :is_active, :is_confirm,:company_hrs)
    end
end
