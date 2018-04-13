class MonthlyIncomeTaxesController < ApplicationController
  before_action :set_monthly_income_tax, only: [:show, :edit, :update, :destroy]

  # GET /monthly_income_taxes
  # GET /monthly_income_taxes.json
  def index
    @monthly_income_taxes = MonthlyIncomeTax.all
  end

  # GET /monthly_income_taxes/1
  # GET /monthly_income_taxes/1.json
  def show
  end

  # GET /monthly_income_taxes/new
  def new
    @monthly_income_tax = MonthlyIncomeTax.new
    @monthly_income_taxes = MonthlyIncomeTax.all
  end

  # GET /monthly_income_taxes/1/edit
  def edit
  end

  # POST /monthly_income_taxes
  # POST /monthly_income_taxes.json
  def create
    @monthly_income_tax = MonthlyIncomeTax.new(monthly_income_tax_params)
    @monthly_income_taxes = MonthlyIncomeTax.all

    respond_to do |format|
      if @monthly_income_tax.save
        @monthly_income_tax = MonthlyIncomeTax.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Monthly Income Tax Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /monthly_income_taxes/1
  # PATCH/PUT /monthly_income_taxes/1.json
  def update
    @monthly_income_tax.update(monthly_income_tax_params)
    @monthly_income_tax = MonthlyIncomeTax.new
    @monthly_income_taxes = MonthlyIncomeTax.all
  end

  # DELETE /monthly_income_taxes/1
  # DELETE /monthly_income_taxes/1.json
  def destroy
    @monthly_income_tax.destroy
    @monthly_income_taxes = MonthlyIncomeTax.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_income_tax
      @monthly_income_tax = MonthlyIncomeTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_income_tax_params
      params.require(:monthly_income_tax).permit(:date, :tax_deposited, :bsr_code, :challan_no, :status)
    end
end
