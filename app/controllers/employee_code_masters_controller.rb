class EmployeeCodeMastersController < ApplicationController
  before_action :set_employee_code_master, only: [:show, :edit, :update, :destroy]

  # GET /employee_code_masters
  # GET /employee_code_masters.json

  # GET /employee_code_masters/1
  # GET /employee_code_masters/1.json
  def show
  end

  # GET /employee_code_masters/new
  def new
    @employee_code_master = EmployeeCodeMaster.new
    @employee_code_masters = EmployeeCodeMaster.all
  end

  # GET /employee_code_masters/1/edit
  def edit
  end

  # POST /employee_code_masters
  # POST /employee_code_masters.json
  def create
    @employee_code_master = EmployeeCodeMaster.new(employee_code_master_params)
    @employee_code_masters = EmployeeCodeMaster.all
    respond_to do |format|
      if @employee_code_master.save
        format.html { redirect_to @employee_code_master, notice: 'Employee code master was successfully created.' }
        format.json { render :show, status: :created, location: @employee_code_master }
      else
        format.html { render :new }
        format.json { render json: @employee_code_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_code_masters/1
  # PATCH/PUT /employee_code_masters/1.json
  def update
    @employee_grade.update(employee_code_master_params)
    @employee_code_masters = EmployeeCodeMaster.all
    @employee_code_master = EmployeeCodeMaster.new
  end

  # DELETE /employee_code_masters/1
  # DELETE /employee_code_masters/1.json
  def destroy
    @employee_code_master.destroy
    @employee_code_masters = EmployeeCodeMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_code_master
      @employee_code_master = EmployeeCodeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_code_master_params
      params.require(:employee_code_master).permit(:name, :range, :last_range, :is_active, :is_confirm)
    end
end
