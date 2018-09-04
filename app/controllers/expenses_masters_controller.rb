class ExpensesMastersController < ApplicationController
  before_action :set_expenses_master, only: [:show, :edit, :update, :destroy]

  # GET /expenses_masters
  # GET /expenses_masters.json
  def index
    @expenses_masters = ExpensesMaster.all
  end

  # GET /expenses_masters/1
  # GET /expenses_masters/1.json
  def show
  end

  # GET /expenses_masters/new
  def new
    @expenses_master = ExpensesMaster.new
    @expenses_masters = ExpensesMaster.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /expenses_masters/1/edit
  def edit
  end

  def collect_expence_opestion
    employee_grade = params[:employee_grade_id]
    @expence_opestion = ExpenceOpestion.where(employee_grade_id: employee_grade)
  end

  def collect_mode
    expence_opestion_id = params[:expence_opestion_id]
    @mode = Mode.where(expence_opestion_id: expence_opestion_id)
  end

  def collect_opestion
    mode_id = params[:mode_id]
    mode = Mode.find(mode_id)
    expence_opestion = mode.expence_opestion_id
    @billing_option = BillingOption.where(expence_opestion_id: expence_opestion)
  end

  # POST /expenses_masters
  # POST /expenses_masters.json
  def create
    employee_grade_id = params[:expenses_master][:employee_grade_id]
    expence_opestion_id = params[:expenses_master][:expence_opestion_id]
    mode_id = params[:expenses_master][:mode_id]
    billing_option_id = params[:expenses_master][:billing_option_id]
    billing_opestion = params[:expenses_master][:billing_opestion]
    min_amount = params[:expenses_master][:min_amount]
    max_amount = params[:expenses_master][:max_amount]
    @expenses = ExpensesMaster.where(employee_grade_id: employee_grade_id, expence_opestion_id: expence_opestion_id, mode_id: mode_id, billing_option_id: billing_option_id, billing_opestion: billing_opestion)
    if  @expenses.present?
      flash[:notice] = "This Record Already Exist"
    else
      @expenses_master = ExpensesMaster.new(expenses_master_params)
      respond_to do |format|
        if @expenses_master.save
          @expence_opestion = ExpenceOpestion.new
          format.js { @flag = true }
        else
          flash.now[:alert] = 'Expence Master Already Exist.'
          format.js { @flag = false }
        end
      end
    end
    @expenses_masters = ExpensesMaster.all
  end

  # PATCH/PUT /expenses_masters/1
  # PATCH/PUT /expenses_masters/1.json
  def update
    @expenses_master.update(expenses_master_params)
    @expenses_masters = ExpensesMaster.all
    @expenses_master = ExpensesMaster.new
  end

  # DELETE /expenses_masters/1
  # DELETE /expenses_masters/1.json
  def destroy
    @expenses_master.destroy
    @expenses_masters = ExpensesMaster.all
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_expenses_masters_path
      else
     ExpensesMaster.import(params[:file])
     redirect_to new_expenses_master_path, notice: "File imported."
     end
  end

  def expence_detail
    @expenses_masters = ExpensesMaster.all
    respond_to do |f|
      f.js
      f.xls {render template: 'expenses_masters/expence_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'expence_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'expenses_masters/expence_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expenses_master
      @expenses_master = ExpensesMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expenses_master_params
      params.require(:expenses_master).permit(:expence_opestion_id, :mode_id, :billing_opestion, :billing_option_id, :employee_grade_id, :min_amount, :max_amount, :status)
    end
end
