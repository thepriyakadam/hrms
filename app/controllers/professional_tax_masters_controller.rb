class ProfessionalTaxMastersController < ApplicationController
  before_action :set_professional_tax_master, only: [:show, :edit, :update, :destroy]

  # GET /professional_tax_masters
  # GET /professional_tax_masters.json
  def index
    @professional_tax_masters = ProfessionalTaxMaster.all
  end

  # GET /professional_tax_masters/1
  # GET /professional_tax_masters/1.json
  def show
  end

  # GET /professional_tax_masters/new
  def new
    @professional_tax_master = ProfessionalTaxMaster.new
  end

  # GET /professional_tax_masters/1/edit
  def edit
  end

  # POST /professional_tax_masters
  # POST /professional_tax_masters.json
  def create
    @professional_tax_master = ProfessionalTaxMaster.new(professional_tax_master_params)

    respond_to do |format|
      if @professional_tax_master.save
        format.html { redirect_to @professional_tax_master, notice: 'Professional tax master was successfully created.' }
        format.json { render :show, status: :created, location: @professional_tax_master }
      else
        format.html { render :new }
        format.json { render json: @professional_tax_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_tax_masters/1
  # PATCH/PUT /professional_tax_masters/1.json
  def update
    respond_to do |format|
      if @professional_tax_master.update(professional_tax_master_params)
        format.html { redirect_to @professional_tax_master, notice: 'Professional tax master was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_tax_master }
      else
        format.html { render :edit }
        format.json { render json: @professional_tax_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_tax_masters/1
  # DELETE /professional_tax_masters/1.json
  def destroy
    @professional_tax_master.destroy
    respond_to do |format|
      format.html { redirect_to professional_tax_masters_url, notice: 'Professional tax master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_tax_master
      @professional_tax_master = ProfessionalTaxMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_tax_master_params
      params.require(:professional_tax_master).permit(:base_component, :min_amount, :max_amount, :for_month, :march_amount, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
