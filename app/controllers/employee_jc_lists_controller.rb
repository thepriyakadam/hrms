class EmployeeJcListsController < ApplicationController
  before_action :set_employee_jc_list, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /employee_jc_lists
  # GET /employee_jc_lists.json
  def index
    @employee_jc_lists = EmployeeJcList.all
  end

  # GET /employee_jc_lists/1
  # GET /employee_jc_lists/1.json
  def show
  end

  # GET /employee_jc_lists/new
  def new
    @employee_jc_list = EmployeeJcList.new
  end

  # GET /employee_jc_lists/1/edit
  def edit
  end

  # POST /employee_jc_lists
  # POST /employee_jc_lists.json
  def create
    @employee_jc_list = EmployeeJcList.new(employee_jc_list_params)
     @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee_jc_list.save


        format.html { redirect_to @employee_jc_list, notice: 'Employee jc list was successfully created.' }
        format.json { render :show, status: :created, location: @employee_jc_list }
      else
        format.html { render :new }
        format.json { render json: @employee_jc_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_jc_lists/1
  # PATCH/PUT /employee_jc_lists/1.json
  def update
    respond_to do |format|
      if @employee_jc_list.update(employee_jc_list_params)
        format.html { redirect_to @employee_jc_list, notice: 'Employee jc list was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_jc_list }
      else
        format.html { render :edit }
        format.json { render json: @employee_jc_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_jc_lists/1
  # DELETE /employee_jc_lists/1.json
  def destroy
    @employee_jc_list.destroy
    respond_to do |format|
      format.html { redirect_to employee_jc_lists_url, notice: 'Employee jc list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def assign_to_employee
  #   employee = Employee.find(params[:employee_id])
  #   @joining_checklist_masters = JoiningChecklistMaster.where(status: true)
  #     @joining_checklist_masters.each do |jc|
  #       if EmployeeJcList.exists?(joining_checklist_master_id: jc.id,employee_id: employee.id)
  #       else
  #         EmployeeJcList.create(joining_checklist_master_id: jc.id,employee_id: employee.id,status: false)
  #         flash[:notice] = "Successfully Added!"
  #       end
  #     end#do |jc|
  #   redirect_to employees_path(employee.id)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_jc_list
      @employee_jc_list = EmployeeJcList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_jc_list_params
      params.require(:employee_jc_list).permit(:joining_checklist_master_id, :employee_id, :admin_id, :status)
    end
end
