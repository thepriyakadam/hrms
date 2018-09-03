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
    @expenses_master = ExpensesMaster.new(expenses_master_params)
    @expenses_masters = ExpensesMaster.all

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
        redirect_to import_xl_expence_opestions_path
      else
     ExpenceOpestion.import(params[:file])
     redirect_to expence_opestions_path, notice: "File imported."
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
