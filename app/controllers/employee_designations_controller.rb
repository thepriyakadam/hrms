class EmployeeDesignationsController < ApplicationController
  before_action :set_employee_designation, only: [:show, :edit, :update, :destroy]

  # GET /employee_designations
  # GET /employee_designations.json
  def index
    @employee_designations = EmployeeDesignation.all
  end

  # GET /employee_designations/1
  # GET /employee_designations/1.json
  def show
  end

  # GET /employee_designations/new
  def new
    @employee_designation = EmployeeDesignation.new
  end

  # GET /employee_designations/1/edit
  def edit
  end

  # POST /employee_designations
  # POST /employee_designations.json
  def create
    @employee_designation = EmployeeDesignation.new(employee_designation_params)

    respond_to do |format|
      if @employee_designation.save
        format.html { redirect_to @employee_designation, notice: 'Employee designation was successfully created.' }
        format.json { render :show, status: :created, location: @employee_designation }
      else
        format.html { render :new }
        format.json { render json: @employee_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_designations/1
  # PATCH/PUT /employee_designations/1.json
  def update
    respond_to do |format|
      if @employee_designation.update(employee_designation_params)
        format.html { redirect_to @employee_designation, notice: 'Employee designation was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_designation }
      else
        format.html { render :edit }
        format.json { render json: @employee_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_designations/1
  # DELETE /employee_designations/1.json
  def destroy
    @employee_designation.destroy
    respond_to do |format|
      format.html { redirect_to employee_designations_url, notice: 'Employee designation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_designation
      @employee_designation = EmployeeDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_designation_params
      params.require(:employee_designation).permit(:name)
    end
end
