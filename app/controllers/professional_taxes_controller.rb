class ProfessionalTaxesController < ApplicationController
  before_action :set_professional_tax, only: [:show, :edit, :update, :destroy]

  # GET /professional_taxes
  # GET /professional_taxes.json
  def index
    @professional_taxes = ProfessionalTax.all
  end

  # GET /professional_taxes/1
  # GET /professional_taxes/1.json
  def show
  end

  # GET /professional_taxes/new
  def new
    @professional_tax = ProfessionalTax.new
  end

  # GET /professional_taxes/1/edit
  def edit
  end

  # POST /professional_taxes
  # POST /professional_taxes.json
  def create
    @professional_tax = ProfessionalTax.new(professional_tax_params)

    respond_to do |format|
      if @professional_tax.save
        format.html { redirect_to @professional_tax, notice: 'Professional tax was successfully created.' }
        format.json { render :show, status: :created, location: @professional_tax }
      else
        format.html { render :new }
        format.json { render json: @professional_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_taxes/1
  # PATCH/PUT /professional_taxes/1.json
  def update
    respond_to do |format|
      if @professional_tax.update(professional_tax_params)
        format.html { redirect_to @professional_tax, notice: 'Professional tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_tax }
      else
        format.html { render :edit }
        format.json { render json: @professional_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_taxes/1
  # DELETE /professional_taxes/1.json
  def destroy
    @professional_tax.destroy
    respond_to do |format|
      format.html { redirect_to professional_taxes_url, notice: 'Professional tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_tax
      @professional_tax = ProfessionalTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_tax_params
      params.require(:professional_tax).permit(:is_pt, :min_salary, :max_salary, :pt_amount, :for_months, :march_month)
    end
end
