class SubDepartmentsController < ApplicationController
  before_action :set_sub_department, only: [:show, :edit, :update, :destroy]

  # GET /sub_departments
  # GET /sub_departments.json
  def index
    @sub_department = SubDepartment.new
    @sub_departments = SubDepartment.all
  end

  # GET /sub_departments/1
  # GET /sub_departments/1.json
  def show
  end

  # GET /sub_departments/new
  def new
    @sub_department = SubDepartment.new
    @sub_departments = SubDepartment.all
    session[:active_tab] = "company"
  end

  # GET /sub_departments/1/edit
  def edit
  end

  # POST /sub_departments
  # POST /sub_departments.json
  def create
    @sub_department = SubDepartment.new(sub_department_params)
    @sub_departments = SubDepartment.all
    respond_to do |format|
      if @sub_department.save
         @sub_department = SubDepartment.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /sub_departments/1
  # PATCH/PUT /sub_departments/1.json
  def update
     @sub_department.update(sub_department_params)
     @sub_departments = SubDepartment.all
     @sub_department = SubDepartment.new
  end

  # DELETE /sub_departments/1
  # DELETE /sub_departments/1.json
  def destroy
    @sub_department.destroy
    @sub_departments = SubDepartment.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_department
      @sub_department = SubDepartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_department_params
      params.require(:sub_department).permit(:department_id, :code, :name, :status)
    end
end
