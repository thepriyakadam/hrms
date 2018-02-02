class DearnessAllowancesController < ApplicationController
  before_action :set_dearness_allowance, only: [:show, :edit, :update, :destroy]

  # GET /dearness_allowances
  # GET /dearness_allowances.json
  def index
    
  end

  # GET /dearness_allowances/1
  # GET /dearness_allowances/1.json
  def show
  end

  # GET /dearness_allowances/new
  def new
    @dearness_allowance = DearnessAllowance.new
    @dearness_allowances = DearnessAllowance.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /dearness_allowances/1/edit
  def edit
  end

  # POST /dearness_allowances
  # POST /dearness_allowances.json
  def create
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

    @dearness_allowance = DearnessAllowance.new(dearness_allowance_params)
    @dearness_allowance.base_component = str
    @dearness_allowances = DearnessAllowance.all
    @dearness_allowance.save
    @dearness_allowance = DearnessAllowance.new
    end
  # PATCH/PUT /dearness_allowances/1
  # PATCH/PUT /dearness_allowances/1.json
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
    @dearness_allowance.base_component = str
    @dearness_allowance.update(dearness_allowance_params)
    @dearness_allowances = DearnessAllowance.all
    @dearness_allowance = DearnessAllowance.new

  end

  # DELETE /dearness_allowances/1
  # DELETE /dearness_allowances/1.json
  def destroy
    @dearness_allowance.destroy
    @dearness_allowance = DearnessAllowance.new
    @dearness_allowances = DearnessAllowance.all
  end

  def dearness_allowances_modal
    @dearness_allowance = DearnessAllowance.find(params[:format])
  end
  
  def is_confirm
    @dearness_allowance = DearnessAllowance.find(params[:dearness_allowance])
    DearnessAllowance.find(@dearness_allowance.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_dearness_allowance_path
  end

  def dearness_allowances_modal
    @dearness_allowance = DearnessAllowance.find(params[:format])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dearness_allowance
      @dearness_allowance = DearnessAllowance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dearness_allowance_params
      params.require(:dearness_allowance).permit(:base_component, :minimum_wages, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
