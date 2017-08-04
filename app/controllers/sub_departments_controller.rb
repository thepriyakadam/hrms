class SubDepartmentsController < ApplicationController
  before_action :set_sub_department, only: [:show, :edit, :update, :destroy]

  # GET /sub_departments
  # GET /sub_departments.json
  def index
    @sub_departments = SubDepartment.all
  end

  # GET /sub_departments/1
  # GET /sub_departments/1.json
  def show
  end

  # GET /sub_departments/new
  def new
    @sub_department = SubDepartment.new
  end

  # GET /sub_departments/1/edit
  def edit
  end

  # POST /sub_departments
  # POST /sub_departments.json
  def create
    @sub_department = SubDepartment.new(sub_department_params)

    respond_to do |format|
      if @sub_department.save
        format.html { redirect_to @sub_department, notice: 'Sub department was successfully created.' }
        format.json { render :show, status: :created, location: @sub_department }
      else
        format.html { render :new }
        format.json { render json: @sub_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_departments/1
  # PATCH/PUT /sub_departments/1.json
  def update
    respond_to do |format|
      if @sub_department.update(sub_department_params)
        format.html { redirect_to @sub_department, notice: 'Sub department was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_department }
      else
        format.html { render :edit }
        format.json { render json: @sub_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_departments/1
  # DELETE /sub_departments/1.json
  def destroy
    @sub_department.destroy
    respond_to do |format|
      format.html { redirect_to sub_departments_url, notice: 'Sub department was successfully destroyed.' }
      format.json { head :no_content }
    end
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
