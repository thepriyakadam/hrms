class SalaryCompMappingsController < ApplicationController
  before_action :set_salary_comp_mapping, only: [:show, :edit, :update, :destroy]

  # GET /salary_comp_mappings
  # GET /salary_comp_mappings.json
  def index
    @salary_comp_mappings = SalaryCompMapping.all
  end

  # GET /salary_comp_mappings/1
  # GET /salary_comp_mappings/1.json
  def show
  end

  # GET /salary_comp_mappings/new
  def new
    @salary_comp_mapping = SalaryCompMapping.new
    @salary_comp_mappings = SalaryCompMapping.all
  end

  # GET /salary_comp_mappings/1/edit
  def edit
  end
                      

   def create
    @salary_comp_mapping = SalaryCompMapping.new(salary_comp_mapping_params)
    @salary_comp_mappings = SalaryCompMapping.all
    respond_to do |format|
      if @salary_comp_mapping.save
        @salary_comp_mapping = SalaryCompMapping.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Salary Comp Mapping Already Exist'
        format.js { @flag = false }
      end
    end
  end

  def update
      @salary_comp_mapping.update(salary_comp_mapping_params)
      @salary_comp_mappings = SalaryCompMapping.all
      @salary_comp_mapping = SalaryCompMapping.new
    end

  def destroy
      @salary_comp_mapping.destroy
      @salary_comp_mappings = SalaryCompMapping.all
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_comp_mapping
      @salary_comp_mapping = SalaryCompMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_comp_mapping_params
      params.require(:salary_comp_mapping).permit(:salary_component_id, :erp_account_code, :map_type)
    end
end
