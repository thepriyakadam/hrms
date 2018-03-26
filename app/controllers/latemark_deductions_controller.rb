class LatemarkDeductionsController < ApplicationController
  before_action :set_latemark_deduction, only: [:show, :edit, :update, :destroy]

  # GET /latemark_deductions
  # GET /latemark_deductions.json
  def index
    @latemark_deductions = LatemarkDeduction.all
  end

  # GET /latemark_deductions/1
  # GET /latemark_deductions/1.json
  def show
  end

  # GET /latemark_deductions/new
  def new
    @latemark_deduction = LatemarkDeduction.new
    @latemark_deductions = LatemarkDeduction.all
  end

  # GET /latemark_deductions/1/edit
  def edit
  end

  # POST /latemark_deductions
  # POST /latemark_deductions.json
  def create
    @latemark_deduction = LatemarkDeduction.new(latemark_deduction_params)
    @latemark_deductions = LatemarkDeduction.all
    @latemark_deduction.save
    @latemark_deduction = LatemarkDeduction.new
    redirect_to new_latemark_deduction_path
    flash[:notice] = "Saved Successfully"
  end

  # PATCH/PUT /latemark_deductions/1
  # PATCH/PUT /latemark_deductions/1.json
  def update
    @latemark_deduction.update(latemark_deduction_params)
    @latemark_deductions = LatemarkDeduction.all
    @latemark_deduction = LatemarkDeduction.new
    redirect_to new_latemark_deduction_path
    flash[:notice] = "Updated Successfully"
  end

  # DELETE /latemark_deductions/1
  # DELETE /latemark_deductions/1.json
  def destroy
    @latemark_deduction.destroy
    @latemark_deductions = LatemarkDeduction.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latemark_deduction
      @latemark_deduction = LatemarkDeduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latemark_deduction_params
      params.require(:latemark_deduction).permit(:employee_id, :latemark_day, :latemark_count, :latemark_amount)
    end
end
