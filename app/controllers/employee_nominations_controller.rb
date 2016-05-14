class EmployeeNominationsController < ApplicationController
  before_action :set_employee_nomination, only: [:show, :edit, :update, :destroy]

  # GET /employee_nominations
  # GET /employee_nominations.json
  def index
    @employee_nominations = EmployeeNomination.all
  end

  # GET /employee_nominations/1
  # GET /employee_nominations/1.json
  def show
  end

  # GET /employee_nominations/new
  def new
    @employee_nomination = EmployeeNomination.new
    @employee_nominations = EmployeeNomination.all
  end

  # GET /employee_nominations/1/edit
  def edit
  end

  # POST /employee_nominations
  # POST /employee_nominations.json
  def create
    @employee_nomination = EmployeeNomination.new(employee_nomination_params)

      if @employee_nomination.save
        @flag = true
        @employee_nomination = EmployeeNomination.new
        @employee_nominations = EmployeeNomination.all
      else
        @flag = false
      end
  end

  # PATCH/PUT /employee_nominations/1
  # PATCH/PUT /employee_nominations/1.json
  def update
      if @employee_nomination.update(employee_nomination_params)
        @flag = true
        @employee_nomination = EmployeeNomination.new
        @employee_nominations = EmployeeNomination.all
      else
        @flag = false
      end
  end

  # DELETE /employee_nominations/1
  # DELETE /employee_nominations/1.json
  def destroy
    @employee_nomination.destroy
    flash[:notice] = 'Deleted Successfully'
    redirect_to new_employee_nomination_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_nomination
      @employee_nomination = EmployeeNomination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_nomination_params
      params.require(:employee_nomination).permit(:nominational_master_id, :family_id, :nomination, :mental_illness, :minor, :guardian_name, :relation_master_id, :same_address, :address, :city, :district_id, :state_id, :country_id, :pin_code, :phone_no, :mobile_no, :email)
    end
end
