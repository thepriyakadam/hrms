class AttributeRatingSheetsController < ApplicationController
  before_action :set_attribute_rating_sheet, only: [:show, :edit, :update, :destroy]

  # GET /attribute_rating_sheets
  # GET /attribute_rating_sheets.json
  def index
    @attribute_rating_sheet = AttributeRatingSheet.new 
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: current_user.employee_id)
  end

  # GET /attribute_rating_sheets/1
  # GET /attribute_rating_sheets/1.json
  def show
  end

  # GET /attribute_rating_sheets/new
  def new
    @attribute_rating_sheet = AttributeRatingSheet.new
    @employee_attributes = []
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: current_user.employee_id)

    if @attribute_rating_sheets.empty?
      @employee_attributes = EmployeeAttribute.where(employee_id: current_user.employee_id)
    else
      @attribute_rating_sheets.each do |a|
        temp = AttributeRatingSheet.exists?(appraisee_id: current_user.employee_id, employee_attribute_id: a.employee_attribute_id)
        if temp
        else
          ea = EmployeeAttribute.find(a.employee_attribute_id)
          @employee_attributes << ea
        end
      end
    end
  end

  # GET /attribute_rating_sheets/1/edit
  def edit
    @employee_attributes = EmployeeAttribute.all
  end

  # POST /attribute_rating_sheets
  # POST /attribute_rating_sheets.json
  def create
    attribute_rating_sheet_ids = params[:employee_attribute_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating_id]
    final = attribute_rating_sheet_ids.zip(comments, ratings)

    final.each do |e, c, r|
      emp = EmployeeAttribute.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        AttributeRatingSheet.create(appraisee_comment: c, appraisee_rating_id: r, appraisee_id: params[:appraisee_id], employee_attribute_id: emp.id)
        flash[:notice] = 'Employee Attribute Created Successfully'
      end
    end

    redirect_to new_attribute_rating_sheet_path
  end

  # PATCH/PUT /attribute_rating_sheets/1
  # PATCH/PUT /attribute_rating_sheets/1.json
  def update
    @employee = Employee.find(params[:appraiser_id])
    if @attribute_rating_sheet.update(attribute_rating_sheet_params)
      flash[:notice] = "Employee Attribute Updated Successfully"
      redirect_to attribute_rating_sheets_path
    else
      flash[:alert] = "Not Updated"
      redirect_to new_attribute_rating_sheet_path
    end
  end

  # DELETE /attribute_rating_sheets/1
  # DELETE /attribute_rating_sheets/1.json
  def destroy
    @attribute_rating_sheet.destroy
    respond_to do |format|
      format.html { redirect_to attribute_rating_sheets_url, notice: 'Attribute rating sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appraiser
    @employee = Employee.find(params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id)
    @attribute_ratings = AttributeRatingSheet.where(appraisee_id: @employee.id, appraiser_comment: nil)
    #byebug
    @attribute_rating_sheet = AttributeRatingSheet.new
  end

  def appraiser_create
    attribute_rating_sheets = params[:attribute_rating_sheet_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating_id]
    final = attribute_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      attribute_rating_sheet = AttributeRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        attribute_rating_sheet.update(appraiser_comment: c, appraiser_rating_id: r, appraiser_id: params[:appraiser_id])
      end
    end
    @employee = Employee.find(params[:appraisee_id])

    redirect_to appraiser_attribute_rating_sheets_path(format: @employee.id)
  end

  def edit_attribute_rating
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def edit_appraiser
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end
  
  def update_appraiser

    @employee = Employee.find(params[:appraiser_id])

    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])

    if @attribute_rating_sheet.update(attribute_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
   
    redirect_to appraiser_attribute_rating_sheets_path(format: @employee.id)
  end

  def is_confirm_appraiser
    
     @attribute_rating_sheet_ids = params[:attribute_rating_sheet_ids]
    if @attribute_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to attribute_rating_sheets_path
      else
        @attribute_rating_sheet_ids.each do |aid|
        @attribute_rating_sheet = AttributeRatingSheet.find(aid)
        @attribute_rating_sheet.update(is_confirm_appraiser: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to appraiser_attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
    end
  end

  def is_confirm_appraisee

     @attribute_rating_sheet_ids = params[:attribute_rating_sheet_ids]
    if @attribute_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to attribute_rating_sheets_path
      else
        @attribute_rating_sheet_ids.each do |aid|
        @attribute_rating_sheet = AttributeRatingSheet.find(aid)
        @attribute_rating_sheet.update(is_confirm_appraisee: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
    end
  end

   def is_confirm_final
    @employee = Employee.find(params[:id])
    @attribute_rating_sheet_ids = params[:attribute_rating_sheet_ids]
    if @attribute_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to final_comment_attribute_rating_sheets_path(format: @employee.id)
      else
        @attribute_rating_sheet_ids.each do |gid|
        @attribute_rating_sheet = AttributeRatingSheet.find(gid)
        @attribute_rating_sheet.update(is_confirm_final: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to final_comment_attribute_rating_sheets_path(format: @employee.id)
    end  
  end

  def is_confirm_appraiser2 
    @employee = Employee.find(params[:id])
    @attribute_rating_sheet_ids = params[:attribute_rating_sheet_ids]
    if @attribute_rating_sheet_ids.nil?
        flash[:alert] = "Please Select the Checkbox"
        redirect_to appraiser2_attribute_rating_sheets_path(@employee.id)
      else
        @attribute_rating_sheet_ids.each do |gid|
        @attribute_rating_sheet = AttributeRatingSheet.find(gid)
        @attribute_rating_sheet.update(is_confirm_appraiser2: true)
        flash[:notice] = "Confirmed Successfully"
      end  
       redirect_to appraiser2_attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
    end  
  end


  # def employee_info
  #   @employee = Employee.find(params[:format])
  #   @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
  #   @qualification = Qualification.find_by_employee_id(@employee.id) 
  # end

  def subordinate_list
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.subordinates
  end

  def employee_details
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
  end

  def employee_list
    @employees = Employee.all
  end

  def employee_final_details
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
  end

   def subordinate_list2
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
  end

  def employee_appraiser2_details
   @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]) 
    @employees = current_login.subordinates
    session[:active_tab] ="performance"
  end


  def appraiser2
    @employee = Employee.find(params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)
    @attribute_ratings = AttributeRatingSheet.where(appraisee_id: @employee.id, appraiser_comment: nil)
    
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
    @attribute_rating_sheet = AttributeRatingSheet.new
  end

  def appraiser2_create

    attribute_rating_sheets = params[:attribute_rating_sheet_id]
    comments = params[:appraiser2_comment]
    ratings = params[:appraiser2_rating_id]
    final = attribute_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      attribute_rating_sheet = AttributeRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        attribute_rating_sheet.update(appraiser2_comment: c, appraiser2_rating_id: r, appraiser_2_id: params[:appraiser_2_id])
      end
    end
    @employee = Employee.find(params[:id])

    redirect_to appraiser2_attribute_rating_sheets_path(format: @employee.id)
  end

  def final_comment
    #@attribute_rating_sheet = AttributeRatingSheet.new
    
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: params[:format]).group(:appraisee_id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format])
  end

  def final_create
     #@attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    
    attribute_rating_sheets = params[:attribute_rating_sheet_id]
    comments = params[:final_comment]
    ratings = params[:final_rating_id]
    final = attribute_rating_sheets.zip(comments, ratings)
    final.each do |e, c, r|
      attribute_rating_sheet = AttributeRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        attribute_rating_sheet.update(final_comment: c, final_rating_id: r, final_id_id: params[:final_id_id])
      end
    end
      @employee = Employee.find(params[:id])
      redirect_to final_comment_attribute_rating_sheets_path(@employee.id)
  end

  def edit_final
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_final
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @employee = Employee.find(@attribute_rating_sheet.appraisee_id)

    if @attribute_rating_sheet.update(attribute_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
    redirect_to final_comment_attribute_rating_sheets_path(format: @employee.id)
  end

  def edit_appraiser2
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_appraiser2
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @employee = Employee.find(@attribute_rating_sheet.appraisee_id)

    if @attribute_rating_sheet.update(attribute_rating_sheet_params)
      flash[:notice] = "Updated Successfully."
    else
      flash[:alert] = "Not Updated "
    end
   
    redirect_to appraiser2_attribute_rating_sheets_path(format: @employee.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attribute_rating_sheet
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attribute_rating_sheet_params
    params.require(:attribute_rating_sheet).permit(:final_id,:appraiser_2_id,:final_comment,:final_rating_id,:appraiser2_comment,:appraiser2_rating_id,:is_confirm_final,:is_confirm_appraiser2,:is_confirm_appraisee,:is_confirm_appraiser,:appraisee_id, :appraiser_id, :employee_attribute_id, :appraisee_comment, :appraisee_rating_id, :appraiser_comment, :appraiser_rating_id)
  end

end
