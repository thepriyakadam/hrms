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
   @employee = @employee_nomination.employee
  end

  # GET /employee_nominations/new
  def new
    @employee_nomination = EmployeeNomination.new
    @employee = Employee.find(params[:id])
  end

  # GET /employee_nominations/1/edit
  def edit
    @form = 'employee_nomination'
    @employee = @employee_nomination.employee
  end

  # POST /employee_nominations
  # POST /employee_nominations.json
  def create
    @employee_nomination = EmployeeNomination.new(employee_nomination_params)
    @employee = Employee.find(params[:employee_nomination][:employee_id])
    respond_to do |format|
      if @employee_nomination.save
        format.html { redirect_to @employee_nomination, notice: 'Nominies was successfully created.' }
        format.json { render :show, status: :created, location: @employee_nomination }
        @employee_nominations = @employee.employee_nominations
        format.js { @flag = true }
      else
        format.html { render :new }
        format.json { render json: @employee_nomination.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /employee_nominations/1
  # PATCH/PUT /employee_nominations/1.json
  def update
    @employee = Employee.find(params['employee_nomination']['employee_id'])
    respond_to do |format|
      if @employee_nomination.update(employee_nomination_params)
        # format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        # format.json { render :show, status: :ok, location: @family }
        @employee_nominations = @employee.employee_nominations
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @family.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /employee_nominations/1
  # DELETE /employee_nominations/1.json
  def destroy
    @employee_nomination.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: 'successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_nomination
      @employee_nomination = EmployeeNomination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_nomination_params
      params.require(:employee_nomination).permit(:employee_id,:illness_type_id,:nomination_master_id, :family_id, :nomination, :mental_illness, :minor, :guardian_name, :relation_master_id, :same_address, :address, :city, :district_id, :state_id, :country_id, :pin_code, :phone_no, :mobile_no, :email)
    end
end
