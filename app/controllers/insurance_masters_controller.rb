class InsuranceMastersController < ApplicationController
  before_action :set_insurance_master, only: [:show, :edit, :update, :destroy]

  # GET /insurance_masters
  # GET /insurance_masters.json
  def index
  end

  # GET /insurance_masters/1
  # GET /insurance_masters/1.json
  def show
  end

  # GET /insurance_masters/new
  def new
    @insurance_master = InsuranceMaster.new
    @insurance_masters = InsuranceMaster.all
  end

  # GET /insurance_masters/1/edit
  def edit
  end

  # POST /insurance_masters
  # POST /insurance_masters.json

  def create
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end

    @insurance_master = InsuranceMaster.new(insurance_master_params)
    @insurance_master.base_component = str
    @insurance_masters = InsuranceMaster.all   
    @insurance_master.save

    redirect_to new_insurance_master_path
    flash[:notice] = "Saved Successfully"
  end

  # PATCH/PUT /insurance_masters/1
  # PATCH/PUT /insurance_masters/1.json
  def update
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @insurance_master.base_component = str
    @insurance_master = InsuranceMaster.new(insurance_master_params)
    @insurance_masters = InsuranceMaster.all   
    @insurance_master = InsuranceMaster.new
    redirect_to new_insurance_master_path
    flash[:notice] = "Updated Successfully"
  end

  # DELETE /insurance_masters/1
  # DELETE /insurance_masters/1.json
  def destroy
    @insurance_master.destroy
    @insurance_masters = InsuranceMaster.all
  end

   def is_confirm
    @insurance_master = InsuranceMaster.find(params[:insurance_master])
    InsuranceMaster.find(@insurance_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_insurance_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_master
      @insurance_master = InsuranceMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_master_params
      params.require(:insurance_master).permit(:is_insurance, :percentage, :base_component, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
