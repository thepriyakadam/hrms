class EmployeeGradesController < ApplicationController
  before_action :set_employee_grade, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

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
  
  def employee_grade_master
     @employee_grades = EmployeeGrade.all
     respond_to do |f|
      f.js
      f.xls {render template: 'employee_grades/employee_grade_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' employee_grade_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_grades/employee_grade_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_employee_grades_path
      else
     EmployeeGrade.import(params[:file])
     redirect_to new_employee_grade_path, notice: "File imported."
     end
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
