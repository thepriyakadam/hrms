class SalaryMapSapsController < ApplicationController
  before_action :set_salary_map_sap, only: [:show, :edit, :update, :destroy]

  # GET /salary_map_saps
  # GET /salary_map_saps.json
  def index
    @salary_map_saps = SalaryMapSap.all
  end

  # GET /salary_map_saps/1
  # GET /salary_map_saps/1.json
  def show
  end

  # GET /salary_map_saps/new
  def new
    @salary_map_saps = SalaryMapSap.all
    @salary_map_sap = SalaryMapSap.new
  end

  # GET /salary_map_saps/1/edit
  def edit
  end

  # POST /salary_map_saps
  # POST /salary_map_saps.json

  # def create
  #   @salary_map_sap = SalaryMapSap.new(salary_map_sap_params)
  #   @salary_map_saps = SalaryMapSap.all
  #   respond_to do |format|
  #     if @salary_map_sap.save
  #       @salary_map_sap = SalaryMapSap.new
  #       format.js { @flag = true }
  #     else
  #       format.js { @flag = false }
  #     end
  #   end
  # end


  #  def create
  #   @salary_map_sap = SalaryMapSap.new(salary_map_sap_params)
  #   @salary_map_saps = SalaryMapSap.all
     
  #   respond_to do |format|
  #     if @salary_map_sap.save
  #        @salary_map_sap = SalaryMapSap.new
  #        @company_location = params[:food_deduction][:company_location_id]
  #        @salary_map_sap.update(company_location_id: @company_location)
  #       format.js { @flag = true }
  #     else
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  def create
    @salary_map_sap = SalaryMapSap.new(salary_map_sap_params)
    @salary_map_saps = SalaryMapSap.all
      if @salary_map_sap.save
        @company_location = params[:food_deduction][:company_location_id]
        @salary_map_sap.update(company_location_id: @company_location)
      end
      redirect_to new_salary_map_sap_path
      flash[:notice] = 'Salary Map Sap saved Successfully.'   
  end


def update
    if @salary_map_sap.update(salary_map_sap_params)
      @company_location = params[:food_deduction][:company_location_id]
      @salary_map_sap.update(company_location_id: @company_location)
      @salary_map_sap = SalaryMapSap.new
      @salary_map_saps = SalaryMapSap.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /salary_map_saps/1
  # DELETE /salary_map_saps/1.json
  def destroy
    @salary_map_sap.destroy
    @salary_map_saps = SalaryMapSap.all
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_map_sap
      @salary_map_sap = SalaryMapSap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_map_sap_params
      params.require(:salary_map_sap).permit(:salary_component_id, :company_id,:company_location_id,:account_code, :is_debit)
    end
end
