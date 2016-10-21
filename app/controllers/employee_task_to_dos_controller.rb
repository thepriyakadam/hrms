class EmployeeTaskToDosController < ApplicationController
  before_action :set_employee_task_to_do, only: [:show, :edit, :update, :destroy]

  # GET /employee_task_to_dos
  # GET /employee_task_to_dos.json
  def index
    @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id,status: true)
  end

  # GET /employee_task_to_dos/1
  # GET /employee_task_to_dos/1.json
  def show
  end

  # GET /employee_task_to_dos/new
  def new
    @employee_task_to_do = EmployeeTaskToDo.new
  end

  # GET /employee_task_to_dos/1/edit
  def edit
    @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id,status: true)
  end

  # POST /employee_task_to_dos
  # POST /employee_task_to_dos.json
  def create
    @employee_task_to_do = EmployeeTaskToDo.new(employee_task_to_do_params)
      if @employee_task_to_do.save
        @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id,status: true)
        @employee_task_to_do = EmployeeTaskToDo.new
        @flag = true
      else
        @flag = false
    end
  end

  # PATCH/PUT /employee_task_to_dos/1
  # PATCH/PUT /employee_task_to_dos/1.json
  def update
    @employee_task_to_do.update(employee_task_to_do_params)
    @employee_task_to_dos = EmployeeTaskToDo.where(employee_id: current_user.employee_id,status: true)
  end

  # DELETE /employee_task_to_dos/1
  # DELETE /employee_task_to_dos/1.json
  def destroy
    @employee_task_to_do.destroy
    respond_to do |format|
      format.html { redirect_to employee_task_to_dos_url, notice: 'Employee task to do was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_task_to_do
      @employee_task_to_do = EmployeeTaskToDo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_task_to_do_params
      params.require(:employee_task_to_do).permit(:employee_id, :task_name, :task_date, :status, :task_time, :task_time1)
    end
end
