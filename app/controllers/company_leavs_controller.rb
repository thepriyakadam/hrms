class CompanyLeavsController < ApplicationController
  before_action :set_company_leav, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
 
  def new
    @company_leav = CompanyLeav.new
    @company_leavs = CompanyLeav.all
  end

 
  def edit
  end

  
  def create
    @company_leav = CompanyLeav.new(company_leav_params)
    @company_leav.save
    @company_leavs = CompanyLeav.all
    @company_leav = CompanyLeav.new
       
  end

  def update
    @company_leav.update(company_leav_params)
    @company_leavs = CompanyLeav.all
    @company_leav = CompanyLeav.new
  end

  def destroy
    @company_leav.destroy
    @company_leavs = CompanyLeav.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_leav
      @company_leav = CompanyLeav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_leav_params
      params.require(:company_leav).permit(:employee_grade_id, :leav_category_id, :no_of_leave, :expiry_date)
    end
end
