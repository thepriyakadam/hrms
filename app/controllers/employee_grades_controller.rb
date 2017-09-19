class EmployeeGradesController < ApplicationController
  before_action :set_employee_grade, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @employee_grade = EmployeeGrade.new
    @employee_grades = EmployeeGrade.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="OnBording"
  end

  # GET /employee_grades/1/edit
  def edit
  end

  # POST /employee_grades
  # POST /employee_grades.json
  def create
    @employee_grade = EmployeeGrade.new(employee_grade_params)
    @employee_grades = EmployeeGrade.all
    respond_to do |format|
      if @employee_grade.save
        @employee_grade = EmployeeGrade.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Blood Group Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /employee_grades/1
  # PATCH/PUT /employee_grades/1.json
  def update
    @employee_grade.update(employee_grade_params)
    @employee_grades = EmployeeGrade.all
    @employee_grade = EmployeeGrade.new
  end

  # DELETE /employee_grades/1
  # DELETE /employee_grades/1.json
  def destroy
    @employee_grade.destroy
    @employee_grades = EmployeeGrade.all
  end

  def is_confirm
    @employee_grade = EmployeeGrade.find(params[:employee_grade])
    EmployeeGrade.find(@employee_grade.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_employee_grade_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_grade
    @employee_grade = EmployeeGrade.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_grade_params
    params.require(:employee_grade).permit(:is_confirm,:name,:code,:description)
  end
end
