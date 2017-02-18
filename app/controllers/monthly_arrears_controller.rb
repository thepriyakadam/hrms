class MonthlyArrearsController < ApplicationController
  before_action :set_monthly_arrear, only: [:show, :edit, :update, :destroy]

  # GET /monthly_arrears
  # GET /monthly_arrears.json
  def index
    @monthly_arrear = MonthlyArrear.new
    @monthly_arrears = MonthlyArrear.all
  end

  # GET /monthly_arrears/1
  # GET /monthly_arrears/1.json
  def show
  end

  # GET /monthly_arrears/new
  def new
     @monthly_arrear = MonthlyArrear.new
     @monthly_arrears = MonthlyArrear.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PeriodicComponents"
  end

  # GET /monthly_arrears/1/edit
  def edit
  end

  # POST /monthly_arrears
  # POST /monthly_arrears.json
 

  def create
    @monthly_arrear = MonthlyArrear.new(monthly_arrear_params)
    @monthly_arrears = MonthlyArrear.all
    respond_to do |format|
      if @monthly_arrear.save
        @monthly_arrear = MonthlyArrear.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /monthly_arrears/1
  # PATCH/PUT /monthly_arrears/1.json
  def update
   @monthly_arrear.update(monthly_arrear_params)
   @monthly_arrear = MonthlyArrear.new
   @monthly_arrears = MonthlyArrear.all   
  end

  # DELETE /monthly_arrears/1
  # DELETE /monthly_arrears/1.json
  def destroy
    @monthly_arrear.destroy
     @monthly_arrears = MonthlyArrear.all   
  end

  #  def is_paid
  #   @monthly_arrear = MonthlyArrear.find(params[:monthly_arrear])
  #   MonthlyArrear.find(@monthly_arrear.id).update(is_paid: true)
  #   flash[:notice] = "Paid Successfully"
  #   redirect_to new_monthly_arrear_path
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_arrear
      @monthly_arrear = MonthlyArrear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_arrear_params
      params.require(:monthly_arrear).permit(:employee_id, :day, :amount, :is_paid, :description)
    end
end
