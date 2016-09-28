class ProfessionalTaxesController < ApplicationController
  before_action :set_professional_tax, only: [:show, :edit, :update, :destroy]

  
  def new
    @professional_tax = ProfessionalTax.new
    @professional_taxes = ProfessionalTax.all
    session[:active_tab] ="master"
    session[:active_tab1] ="payrollcomponents"
  end

  # GET /professional_taxes/1/edit
  def edit
  end

  # POST /professional_taxes
  # POST /professional_taxes.json
  def create
    @professional_tax = ProfessionalTax.new(professional_tax_params)
    @professional_taxes = ProfessionalTax.all
    respond_to do |format|
      if @professional_tax.save
        @professional_tax = ProfessionalTax.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'PT Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /professional_taxes/1
  # PATCH/PUT /professional_taxes/1.json
  def update
    @professional_tax.update(professional_tax_params)
    @professional_taxes = ProfessionalTax.all
    @professional_tax = ProfessionalTax.new
  end

  # DELETE /professional_taxes/1
  # DELETE /professional_taxes/1.json
  def destroy
    @professional_tax.destroy
    @professional_taxes = ProfessionalTax.all
  end

  def is_confirm
    @professional_tax = ProfessionalTax.find(params[:professional_tax])
    ProfessionalTax.find(@professional_tax.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_professional_tax_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_professional_tax
    @professional_tax = ProfessionalTax.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def professional_tax_params
    params.require(:professional_tax).permit(:is_confirm,:is_pt, :min_salary, :max_salary, :pt_amount, :for_months, :march_month)
  end
end
