class QuarterIncomeTaxesController < ApplicationController
  before_action :set_quarter_income_tax, only: [:show, :edit, :update, :destroy]

  # GET /quarter_income_taxes
  # GET /quarter_income_taxes.json
  def index
    @quarter_income_taxes = QuarterIncomeTax.all
  end

  # GET /quarter_income_taxes/1
  # GET /quarter_income_taxes/1.json
  def show
  end

  # GET /quarter_income_taxes/new
  def new
    @quarter_income_tax = QuarterIncomeTax.new
    @quarter_income_taxes = QuarterIncomeTax.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end

  # GET /quarter_income_taxes/1/edit
  def edit
  end

  # POST /quarter_income_taxes
  # POST /quarter_income_taxes.json
  def create
    @quarter_income_tax = QuarterIncomeTax.new(quarter_income_tax_params)
    @quarter_income_taxes = QuarterIncomeTax.all

    respond_to do |format|
      if @quarter_income_tax.save
        @quarter_income_tax = QuarterIncomeTax.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Quarter Income Tax Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /quarter_income_taxes/1
  # PATCH/PUT /quarter_income_taxes/1.json
  def update
    @quarter_income_tax.update(quarter_income_tax_params)  
    @quarter_income_tax = QuarterIncomeTax.new
    @quarter_income_taxes = QuarterIncomeTax.all
  end

  # DELETE /quarter_income_taxes/1
  # DELETE /quarter_income_taxes/1.json
  def destroy
    @quarter_income_tax.destroy
    @quarter_income_taxes = QuarterIncomeTax.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quarter_income_tax
      @quarter_income_tax = QuarterIncomeTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quarter_income_tax_params
      params.require(:quarter_income_tax).permit(:date, :quarter, :reciept_no, :paid_amount, :tax_amount_deducted, :tax_amount_deposited)
    end
end
