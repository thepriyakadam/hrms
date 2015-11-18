class EmployeeGradesController < ApplicationController
  before_action :set_employee_grade, only: [:show, :edit, :update, :destroy]

  # GET /employee_grades
  # GET /employee_grades.json
  def index
    @employee_grades = EmployeeGrade.all
  end

  # GET /employee_grades/1
  # GET /employee_grades/1.json
  def show
  end

  # GET /employee_grades/new
  def new
    @employee_grade = EmployeeGrade.new
  end

  # GET /employee_grades/1/edit
  def edit
  end

  # POST /employee_grades
  # POST /employee_grades.json
  def create
    @employee_grade = EmployeeGrade.new(employee_grade_params)

    respond_to do |format|
      if @employee_grade.save
        format.html { redirect_to @employee_grade, notice: 'Employee grade was successfully created.' }
        format.json { render :show, status: :created, location: @employee_grade }
      else
        format.html { render :new }
        format.json { render json: @employee_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_grades/1
  # PATCH/PUT /employee_grades/1.json
  def update
    respond_to do |format|
      if @employee_grade.update(employee_grade_params)
        format.html { redirect_to @employee_grade, notice: 'Employee grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_grade }
      else
        format.html { render :edit }
        format.json { render json: @employee_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_grades/1
  # DELETE /employee_grades/1.json
  def destroy
    @employee_grade.destroy
    respond_to do |format|
      format.html { redirect_to employee_grades_url, notice: 'Employee grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_grade
      @employee_grade = EmployeeGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_grade_params
      params.require(:employee_grade).permit(:name)
    end
end
