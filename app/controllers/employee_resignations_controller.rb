class EmployeeResignationsController < ApplicationController
  before_action :set_employee_resignation, only: [:show, :edit, :update, :destroy]

  # GET /employee_resignations
  # GET /employee_resignations.json
  def index
    @employee_resignations = EmployeeResignation.all
    
  end

  # GET /employee_resignations/1
  # GET /employee_resignations/1.json
  def show
  end

  # GET /employee_resignations/new
  def new
    @employee_resignation = EmployeeResignation.new
  end

  # GET /employee_resignations/1/edit
  def edit
  end

  # POST /employee_resignations
  # POST /employee_resignations.json
  def create
    @employee_resignation = EmployeeResignation.new(employee_resignation_params)

    
      if @employee_resignation.save
         redirect_to employee_resignations_path
        
      else
         render :new 

        
    end
  end

  # PATCH/PUT /employee_resignations/1
  # PATCH/PUT /employee_resignations/1.json
  def update
    @employee_resignation.update(employee_resignation_params)
    @employee_resignations = EmployeeResignation.all
     @employee_resignation = EmployeeResignation.new
     flash[:notice]= "Updated successfully"
     redirect_to employee_resignations_path
  end

  # DELETE /employee_resignations/1
  # DELETE /employee_resignations/1.json
  def destroy
    @employee_resignation.destroy
    respond_to do |format|
      format.html { redirect_to employee_resignations_url, notice: 'Employee resignation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_resignation
      @employee_resignation = EmployeeResignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_resignation_params
      params.require(:employee_resignation).permit(:employee_id, :resignation_date, :reason, :is_notice_period, :notice_period, :short_notice_period, :tentative_leaving_date, :remark, :exit_interview_date, :note, :leaving_date, :settled_on, :has_left, :notice_served, :rehired)
    end
end
