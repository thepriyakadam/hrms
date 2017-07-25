class ChangeDesignationsController < ApplicationController
  before_action :set_change_designation, only: [:show, :edit, :update, :destroy]

  # GET /change_designations
  # GET /change_designations.json
  def index
     if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @change_designations= ChangeDesignation.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @change_designations = ChangeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @change_designations = ChangeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @change_designations = ChangeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @change_designations = ChangeDesignation.where(employee_id: @employees)
      else current_user.role.name == 'Employee'
        @change_designations = ChangeDesignation.where(employee_id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] ="promotionmanagement"
  end

  # GET /change_designations/1
  # GET /change_designations/1.json
  def show
  end

  # GET /change_designations/new
  def new
    @change_designation = ChangeDesignation.new
  end

  # GET /change_designations/1/edit
  def edit
  end

  # POST /change_designations
  # POST /change_designations.json
  def create
    @change_designation = ChangeDesignation.new(change_designation_params)

    respond_to do |format|
      if @change_designation.save
        format.html { redirect_to @change_designation, notice: 'Change designation was successfully created.' }
        format.json { render :show, status: :created, location: @change_designation }
      else
        format.html { render :new }
        format.json { render json: @change_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_designations/1
  # PATCH/PUT /change_designations/1.json
  def update
    respond_to do |format|
      if @change_designation.update(change_designation_params)
        format.html { redirect_to @change_designation, notice: 'Change designation was successfully updated.' }
        format.json { render :show, status: :ok, location: @change_designation }
      else
        format.html { render :edit }
        format.json { render json: @change_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_designations/1
  # DELETE /change_designations/1.json
  def destroy
    @change_designation.destroy
    respond_to do |format|
      format.html { redirect_to change_designations_url, notice: 'Change designation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_designation
      @change_designation = ChangeDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_designation_params
      params.require(:change_designation).permit(:employee_id, :employee_designation_id, :effective_from, :effective_to, :status, :change_by_id)
    end
end
