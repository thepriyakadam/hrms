class RembursmentsController < ApplicationController
  before_action :set_rembursment, only: [:show, :edit, :update, :destroy]

  # GET /rembursments
  # GET /rembursments.json
  def index
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @rembursments = Rembursment.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @rembursments = Rembursment.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @rembursments = Rembursment.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @rembursments = Rembursment.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end

  # GET /rembursments/1
  # GET /rembursments/1.json
  def show
  end

  # GET /rembursments/new
  def new
    @rembursment = Rembursment.new
  end

  # GET /rembursments/1/edit
  def edit
  end

  # POST /rembursments
  # POST /rembursments.json
  def create
    @rembursment = Rembursment.new(rembursment_params)

    respond_to do |format|
      if @rembursment.save
        format.html { redirect_to @rembursment, notice: 'Rembursment was successfully created.' }
        format.json { render :show, status: :created, location: @rembursment }
      else
        format.html { render :new }
        format.json { render json: @rembursment.errors, status: :unprocessable_entity }
      end
    end
  end


  def rembursment_request
    current_login = Employee.find(current_user.employee_id)
    @emp = current_login.subordinates.pluck(:id)
    @emp1 = current_login.indirect_subordinates.pluck(:id)
    @pending_rembursment_requests = Rembursment.where(employee_id: @emp)
    @first_approved_rembursment_requests = Rembursment.where(employee_id: @emp1)
    
  end

  # PATCH/PUT /rembursments/1
  # PATCH/PUT /rembursments/1.json
  def update
    respond_to do |format|
      if @rembursment.update(rembursment_params)
        format.html { redirect_to @rembursment, notice: 'Rembursment was successfully updated.' }
        format.json { render :show, status: :ok, location: @rembursment }
      else
        format.html { render :edit }
        format.json { render json: @rembursment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rembursments/1
  # DELETE /rembursments/1.json
  def destroy
    @rembursment.destroy
    respond_to do |format|
      format.html { redirect_to rembursments_url, notice: 'Rembursment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rembursment
      @rembursment = Rembursment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rembursment_params
      params.require(:rembursment).permit(:employee_id, :manager_id, :application_date, :rembursment_date, :rembursmentmaster_id, :amount, :paid_date, :status)
    end
end
