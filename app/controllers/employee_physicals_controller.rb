class EmployeePhysicalsController < ApplicationController
  before_action :set_employee_physical, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /employee_physicals
  # GET /employee_physicals.json
  def index
    @employee_physicals = EmployeePhysical.all
  end

  # GET /employee_physicals/1
  # GET /employee_physicals/1.json
  def show
  end

  # GET /employee_physicals/new
  def new
    @employee_physical = EmployeePhysical.new
  end

  # GET /employee_physicals/1/edit
  def edit
  end

  # POST /employee_physicals
  # POST /employee_physicals.json
  def create
    @employee_physical = EmployeePhysical.new(employee_physical_params)

    respond_to do |format|
      if @employee_physical.save
        format.html { redirect_to @employee_physical, notice: 'Employee physical was successfully created.' }
        format.json { render :show, status: :created, location: @employee_physical }
      else
        format.html { render :new }
        format.json { render json: @employee_physical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_physicals/1
  # PATCH/PUT /employee_physicals/1.json
  def update
    respond_to do |format|
      if @employee_physical.update(employee_physical_params)
        format.html { redirect_to @employee_physical, notice: 'Employee physical was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_physical }
      else
        format.html { render :edit }
        format.json { render json: @employee_physical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_physicals/1
  # DELETE /employee_physicals/1.json
  def destroy
    @employee_physical.destroy
    respond_to do |format|
      format.html { redirect_to employee_physicals_url, notice: 'Employee physical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_physical
      @employee_physical = EmployeePhysical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_physical_params
      params.require(:employee_physical).permit(:employee_id, :height, :weight, :size)
    end
end
