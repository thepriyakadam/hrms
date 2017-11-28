class CompanyShiftsController < ApplicationController
  before_action :set_company_shift, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

  def new
    @company_shift = CompanyShift.new
    @company_shifts = CompanyShift.all
    session[:active_tab] ="timemgmt"
  end

  # GET /company_shifts/1/edit
  def edit
  end

  # POST /company_shifts
  # POST /company_shifts.json
  def create
    @company_shift = CompanyShift.new(company_shift_params)
    @company_shifts = CompanyShift.all
    respond_to do |format|
      if @company_shift.save

        @company_shift = CompanyShift.new

        format.js { @flag = true }

      else
        flash.now[:alert] = 'Company Shift Already Exist.'
        format.js { @flag = false }
         end
    end
   end

  # PATCH/PUT /company_shifts/1
  # PATCH/PUT /company_shifts/1.json
  def update
    @company_shift.update(company_shift_params)
    @company_shifts = CompanyShift.all
    @company_shift = CompanyShift.new
  end

  # DELETE /company_shifts/1
  # DELETE /company_shifts/1.json
  def destroy
    @company_shift.destroy
    @company_types = CompanyType.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company_shift
    @company_shift = CompanyShift.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_shift_params
    params.require(:company_shift).permit(:name, :in_time, :out_time)
  end
end
