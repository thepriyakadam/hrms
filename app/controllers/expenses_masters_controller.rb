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

    respond_to do |format|
      if @expenses_master.save
        format.html { redirect_to @expenses_master, notice: 'Expenses master was successfully created.' }
        format.json { render :show, status: :created, location: @expenses_master }
      else
        format.html { render :new }
        format.json { render json: @expenses_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses_masters/1
  # PATCH/PUT /expenses_masters/1.json
  def update
    respond_to do |format|
      if @expenses_master.update(expenses_master_params)
        format.html { redirect_to @expenses_master, notice: 'Expenses master was successfully updated.' }
        format.json { render :show, status: :ok, location: @expenses_master }
      else
        format.html { render :edit }
        format.json { render json: @expenses_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses_masters/1
  # DELETE /expenses_masters/1.json
  def destroy
    @expenses_master.destroy
    respond_to do |format|
      format.html { redirect_to expenses_masters_url, notice: 'Expenses master was successfully destroyed.' }
      format.json { head :no_content }
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
