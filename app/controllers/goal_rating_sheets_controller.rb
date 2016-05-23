class GoalRatingSheetsController < ApplicationController
  before_action :set_goal_rating_sheet, only: [:show, :edit, :update, :destroy]

  # GET /goal_rating_sheets
  # GET /goal_rating_sheets.json
  def index
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id)
  end

  # GET /goal_rating_sheets/1
  # GET /goal_rating_sheets/1.json
  def show
  end

  # GET /goal_rating_sheets/new
  def new
    @goal_rating_sheet = GoalRatingSheet.new
    @goal_rting_sheets = EmployeeGoal.where(employee_id: current_user.employee_id).group(:employee_id)
    @employee_goals = EmployeeGoal.where(employee_id: current_user.employee_id,is_confirm: true)
    @period = @employee_goals.try(:first).try(:period)
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)
    @goal_rating_shets = GoalRatingSheet.where(appraisee_id: current_user.employee_id, is_confirm_appraisee: nil).where.not(appraisee_comment: nil)
  end

  # GET /goal_rating_sheets/1/edit
  def edit
    @employee_goals = EmployeeGoal.all
  end

  # POST /goal_rating_sheets
  # POST /goal_rating_sheets.json
  def create
    goal_rating_sheet_ids = params[:employee_goal_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating_id]

    final = goal_rating_sheet_ids.zip(comments, ratings)

    final.each do |e, c, r|
      emp = GoalRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      
      elsif r == ''
        flash[:alert] = 'Fill all the fields'
      else
        emp.update(appraisee_comment: c, appraisee_rating_id: r)
        flash[:notice] = 'Employee Goal Created Successfully'
      end
    end
    redirect_to new_goal_rating_sheet_path
  end

  # PATCH/PUT /goal_rating_sheets/1
  # PATCH/PUT /goal_rating_sheets/1.json
  def update
    if @goal_rating_sheet.update(goal_rating_sheet_params)
      flash[:notice] = 'Updated Successfully'
      redirect_to new_goal_rating_sheet_path
    else
      flash[:alert] = 'Not Updated'
      redirect_to new_goal_rating_sheet_path
    end
  end

  # DELETE /goal_rating_sheets/1
  # DELETE /goal_rating_sheets/1.json
  def destroy
    @goal_rating_sheet.destroy
    respond_to do |format|
      format.html { redirect_to goal_rating_sheets_url, notice: 'Goal rating sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def appraiser 
    @employee = Employee.find(params[:format])
    @goal_ratings = GoalRatingSheet.where(appraisee_id: @employee.id,appraiser_comment: nil,is_confirm_appraisee: true)
    #@goal_ratings = GoalRatingSheet.where("appraisee_id = ? and (appraiser_comment = ? or appraiser_comment = ?)",@employee.id,nil,"")
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id,is_confirm_appraisee: true).where.not(appraiser_comment: nil)
    @goal_rating_single_sheets = GoalRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)

    @goal_rating_sheet = GoalRatingSheet.new
    @performance_periods = PerformancePeriod.all
  end

  def appraiser_create
    goal_rating_sheets = params[:goal_rating_sheet_id]
    # employee_goals = params[:employee_goal_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating_id]
    final = goal_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      goal_rating_sheet = GoalRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        # emp = EmployeeGoal.find(e)
        # goal_rating_sheet = GoalRatingSheet.find(e)
        goal_rating_sheet.update(appraiser_comment: c, appraiser_rating_id: r, appraiser_id: params[:appraiser_id])
      end
    end
    @employee = Employee.find(params[:appraisee_id])
    redirect_to appraiser_goal_rating_sheets_path(format: @employee.id)
  end
  

  def appraiser2
    #@goal_rating_sheet = GoalRatingSheet.new
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format],appraiser2_comment: nil,is_confirm_appraiser: true)
    @goal_rating_shets = GoalRatingSheet.where(appraisee_id: params[:format],is_confirm_appraiser: true).where.not(appraiser2_comment: nil)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
  end

  def appraiser2_create
    @employee = Employee.find(params[:id])
    goal_rating_sheets = params[:goal_rating_sheet_id]
    
    comments = params[:appraiser2_comment]
    ratings = params[:appraiser2_rating_id]
    final = goal_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      goal_rating_sheet = GoalRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        # emp = EmployeeGoal.find(e)
        # goal_rating_sheet = GoalRatingSheet.find(e)
        goal_rating_sheet.update(appraiser2_comment: c, appraiser2_rating_id: r, appraiser_2_id: params[:appraiser_2_id])
      end
    end
    redirect_to  appraiser2_goal_rating_sheets_path(format: @employee.id)
  end

  def final_comment
    @goal_rating_sheet = GoalRatingSheet.new
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format],is_confirm_appraiser2: true).where.not(final_comment: nil)

    @goal_ratings = GoalRatingSheet.where(appraisee_id: params[:format],final_comment: nil,is_confirm_appraiser2: true)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
    @employees = Employee.where(id: @employee.id)
  end
  
  def edit_goal_rating
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end
  
  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
    session[:active_tab] ="performance"
    session[:active_tab1] ="appraiserevaluation"
  end
 
  def edit_appraiser
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_appraiser
    #@goal_rating = GoalRatingSheet.find(params[:])

    @employee = Employee.find(params[:appraiser_id])

    @goal_rating_sheet = GoalRatingSheet.find(params[:id])

    if @goal_rating_sheet.update(goal_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
    
    redirect_to appraiser_goal_rating_sheets_path(format: @employee.id)
  end

  # def destroy_appraiser
  #    @goal_rating = GoalRatingSheet.find(params[:appraiser_id])
  #   @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  #   if @goal_rating_sheet.destroy
  #     flash[:notice] = "Deleted Successfully"
  #     redirect_to appraiser_goal_rating_sheets_path(@goal_rating.appraiser_id)
  #   else
  #     flash[:alert] = "Not Deleted"
  #     redirect_to appraiser_goal_rating_sheets_path(@goal_rating.appraiser_id)
  #   end
  # end

  def is_confirm_appraiser
    @employee = Employee.find(params[:id])
    @goal_rating_sheet_ids = params[:goal_rating_sheet_ids]
    if @goal_rating_sheet_ids.nil?
      flash[:alert] = "Please select the goal ratings"
    else
      @goal_rating_sheet_ids.each do |gid|
        @goal_rating_sheet = GoalRatingSheet.find(gid)
        @goal_rating_sheet.update(is_confirm_appraiser: true)
        flash[:notice] = "Confirmed Successfully"
      end
    end
    redirect_to appraiser_goal_rating_sheets_path(@employee.id)
  end
 
  def is_confirm_appraisee
    @goal_rating_sheet_ids = params[:goal_rating_sheet_ids]
    if @goal_rating_sheet_ids.nil?
      flash[:alert] = "Please select the goal ratings."
      redirect_to new_goal_rating_sheet_path
    else
      @goal_rating_sheet_ids.each do |gid|
        @goal_rating_sheet = GoalRatingSheet.find(gid)
        @goal_rating_sheet.update(is_confirm_appraisee: true)
         flash[:notice] = "Confirmed Successfully"
      end  
      redirect_to new_goal_rating_sheet_path
    end  
  end

  def is_confirm_final
    @employee = Employee.find(params[:id])
    @goal_rating_sheet_ids = params[:goal_rating_sheet_ids]
    if @goal_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to final_comment_goal_rating_sheets_path(format: @employee.id)
      else
        @goal_rating_sheet_ids.each do |gid|
        @goal_rating_sheet = GoalRatingSheet.find(gid)
        @goal_rating_sheet.update(is_confirm_final: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to final_comment_goal_rating_sheets_path(format: @employee.id)
    end  
  end

  def is_confirm_appraiser2
    @employee = Employee.find(params[:id])
    @goal_rating_sheet_ids = params[:goal_rating_sheet_ids]
    if @goal_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to appraiser2_goal_rating_sheets_path(format: @employee.id)
      else
        @goal_rating_sheet_ids.each do |gid|
        @goal_rating_sheet = GoalRatingSheet.find(gid)
        @goal_rating_sheet.update(is_confirm_appraiser2: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to appraiser2_goal_rating_sheets_path(format: @employee.id)
    end 

  end

  
 def appraisee_goal_list
   @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: current_user.employee_id)
 end

 def subordinate_list2
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
    session[:active_tab] ="performance"
    session[:active_tab1] ="appraiserevaluation"
  end

  def edit_appraiser2
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
    #@employee = GoalRatingSheet.find(@goal_rating_sheet.appraisee_id)
  end

  def update_appraiser2
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @employee = Employee.find(@goal_rating_sheet.appraisee_id)

    if @goal_rating_sheet.update(goal_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
   
    redirect_to appraiser2_goal_rating_sheets_path(format: @employee.id)
  end

  def employee_list
    if current_user.class == Member
      if current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
        redirect_to home_index_path
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'Department'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Company'
        @employees = Employee.all
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        # @employees_indirect = @emp.indirect_subordinates
        # @employees_direct = @emp.subordinates
        @employees = @emp.subordinates
      end
    else
      @employees = Employee.all
    end
  session[:active_tab] ="performance"
  session[:active_tab1] ="appraiserevaluation"
  end
  
  def final_create
    @employee = Employee.find(params[:id])
    goal_rating_sheets = params[:goal_rating_sheet_id]
    
    comments = params[:final_comment]
    ratings = params[:final_rating_id]
    final = goal_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      goal_rating_sheet = GoalRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        goal_rating_sheet.update(final_comment: c, final_rating_id: r, final_id_id: params[:final_id_id])
      end
    end
    redirect_to final_comment_goal_rating_sheets_path(format: @employee.id)
  end

  
  def edit_final
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_final
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @employee = Employee.find(@goal_rating_sheet.appraisee_id)

    if @goal_rating_sheet.update(goal_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
   
    redirect_to final_comment_goal_rating_sheets_path(format: @employee.id)

  end

  def modal
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_modal
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @goal_rating_sheet.update(goal_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to new_goal_rating_sheet_path
  end

  def modal_appraiser
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_appraiser_modal
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @goal_rating_sheet.update(goal_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser_goal_rating_sheets_path(@goal_rating_sheet.appraisee_id)
  end

  def modal_appraiser2
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_appraiser2_modal
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @goal_rating_sheet.update(goal_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser2_goal_rating_sheets_path(@goal_rating_sheet.appraisee_id)
  end

  def modal_final
    @goal_rating_sheet = GoalRatingSheet.find(params[:format])
  end

  def update_final_modal
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
    @goal_rating_sheet.update(goal_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to final_comment_goal_rating_sheets_path(@goal_rating_sheet.appraisee_id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal_rating_sheet
    @goal_rating_sheet = GoalRatingSheet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def goal_rating_sheet_params
    params.require(:goal_rating_sheet).permit(:final_id,:appraiser_2_id,:final_comment,:final_rating_id,:appraiser2_comment,:appraiser2_rating_id,:is_confirm_final,:is_confirm_appraiser2,:is_confirm,:appraisee_id, :appraiser_id, :employee_goal_id, :allign_to_supervisor, :appraisee_comment, :appraisee_rating_id, :appraiser_comment, :appraiser_rating_id)
  end

end
