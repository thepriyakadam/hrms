class CompanyTypesController < ApplicationController
  before_action :set_company_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def new
    @company_types = CompanyType.new
    @company_types = CompanyType.all
  end

  
  def edit
  end

  def create
    @company_type = CompanyType.new(company_type_params)
    @company_types = CompanyType.all
    
    respond_to do |format|
      if @company_type.save
        @company_type = CompanyType.new
        #format.html { notice: 'Company was successfully created.' }
        #format.json { render :show, status: :created, location: @company_type }
        format.js { @flag = true }
      else
        #format.html { render :new }
        #format.json { render json: @company_type.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  def update
    @company_type.update(company_type_params)
    @company_types = CompanyType.all
    @company_type = CompanyType.new
  end

  def destroy
    @company_type.destroy
    @company_types = CompanyType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_type
      @company_type = CompanyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_type_params
      params.require(:company_type).permit(:name)
    end
end
