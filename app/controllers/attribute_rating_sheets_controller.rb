class AttributeRatingSheetsController < ApplicationController
  before_action :set_attribute_rating_sheet, only: [:show, :edit, :update, :destroy]

  # GET /attribute_rating_sheets
  # GET /attribute_rating_sheets.json
  def index
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: current_user.employee_id)
  end

  # GET /attribute_rating_sheets/1
  # GET /attribute_rating_sheets/1.json
  def show
  end
  # GET /attribute_rating_sheets/new
  def new
    @attribute_rating_sheet = AttributeRatingSheet.new
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: current_user.employee_id,appraisee_comment: nil)
    @attribute_rating_shets = AttributeRatingSheet.where(appraisee_id: current_user.employee_id).where.not(appraisee_comment: nil)
    
    @employee_attributes = EmployeeAttribute.where(employee_id: current_user.employee_id,is_confirm: true)
  end

  # GET /attribute_rating_sheets/1/edit
  def edit
    @employee_attributes = EmployeeAttribute.all
  end

  # POST /attribute_rating_sheets51285128
  # POST /attribute_rating_sheets.json
  def create
    attribute_rating_sheet_ids = params[:employee_attribute_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating_id]
    final = attribute_rating_sheet_ids.zip(comments, ratings)

    final.each do |e, c, r|
      emp = AttributeRatingSheet.find(e)
      if c == ''
        flash[:alert] = 'Fill comments'
      elsif r == ''
        flash[:alert] = 'Fill ratings'
      else
        emp.update(appraisee_comment: c, appraisee_rating_id: r)
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
    @employees = AttributeRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id,is_confirm_appraisee: true).where.not(appraiser_comment: nil)
    @attribute_ratings = AttributeRatingSheet.where(appraisee_id: @employee.id, appraiser_comment: nil,is_confirm_appraisee: true)
    
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

    @employee = Employee.find(params[:id])
    @attribute_rating_sheet = AttributeRatingSheet.find_by_appraisee_id(@employee.id)
    @employee_attribute = EmployeeAttribute.where(employee_id: @employee.id)

    AttributeRatingSheetMailer.send_email_to_appraiser2(@attribute_rating_sheet).deliver_now
    flash[:notice] = "Email sent Successfully"
    redirect_to appraiser_attribute_rating_sheets_path(@employee.id)


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
        @employee = Employee.find(params[:id])
        @attribute_rating_sheet = AttributeRatingSheet.find_by_appraisee_id(@employee.id)
        @employee_attribute = EmployeeAttribute.where(employee_id: @employee.id)

        AttributeRatingSheetMailer.send_email_to_appraiser(@attribute_rating_sheet).deliver_now
        flash[:notice] = "Email sent Successfully"
        redirect_to new_attribute_rating_sheet_path

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
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser: true)
    @employee = Employee.find(params[:format])
    @attribute_rating_sheets = Employee.where(id: @employee.id).group(:id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser: true)
  end

  def employee_list
    @employees = Employee.all
  end

  def employee_final_details
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format], is_confirm_final: true)
    @attribute_rating_sheets = Employee.where(id: params[:format]).group(:id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format], is_confirm_final: true)
  end

   def subordinate_list2
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
  end

  def employee_appraiser2_details

    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser2: true)
    @attribute_rating_sheets = Employee.where(id: params[:format]).group(:id)
    @employee = Employee.find(params[:format])
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser2: true) 
   
    current_login = Employee.find(current_user.employee_id)
    @employees = current_login.indirect_subordinates
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
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format],appraiser2_comment: nil,is_confirm_appraiser: true)
    @attribute_rating_multi_sheets = AttributeRatingSheet.where(appraisee_id: params[:format],is_confirm_appraiser: true).where.not(appraiser2_comment: nil)
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
    @employee = Employee.find(params[:format])
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)
   
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id,final_comment: nil, is_confirm_appraiser2: true)
    @attribute_rating_multi_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id, is_confirm_appraiser2: true).where.not(final_comment: nil)
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

  def modal
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_modal
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @attribute_rating_sheet.update(attribute_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to new_attribute_rating_sheet_path
  end

  def modal_appraiser
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_appraiser_modal
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @attribute_rating_sheet.update(attribute_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser_attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
  end
  
  def modal_appraiser2
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_appraiser2_modal
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @attribute_rating_sheet.update(attribute_rating_sheet_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to appraiser2_attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
  end
  
  def modal_final
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:format])
  end

  def update_final_modal
    @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    @attribute_rating_sheet.update(attribute_rating_sheet_params)
    flash[:notice] = 'Updatede Successfully'
    redirect_to final_comment_attribute_rating_sheets_path(@attribute_rating_sheet.appraisee_id)
  end

  def print_details_appraiser

    @employee = Employee.find(params[:id])
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id ).group(:appraisee_id)
    @experiences = Experience.where(employee_id: @employee.id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_details_appraiser',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 100,
                          :left   => 12,
                          :right  => 12},
               template: 'attribute_rating_sheets/print_details_appraiser.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end


  def print_details_appraiser2

    @employee = Employee.find(params[:id])
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)
    
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id) 
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_details_appraiser2',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 100,
                          :left   => 12,
                          :right  => 12},
               template: 'attribute_rating_sheets/print_details_appraiser2.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end


  def print_details_final

    @employee = Employee.find(params[:id])
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: @employee.id)
    @attribute_rating_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id).group(:appraisee_id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: @employee.id)
    
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_details_final',
               layout: 'pdf.html',
               :orientation      => 'Landscape', # default , Landscape
               template: 'attribute_rating_sheets/print_details_final.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end
  
  def try
    @goal_rating_sheets = GoalRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser: true)
    @employee = Employee.find("5126")
    @attribute_rating_sheets = Employee.where(id: @employee.id).group(:id)
    @qualifications = Qualification.where(employee_id: @employee.id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @experiences = Experience.where(employee_id: @employee.id)
    @ctc = EmployeeSalaryTemplate.where(employee_id: @employee.id).sum(:monthly_amount)
    @attribute_rating_multiple_sheets = AttributeRatingSheet.where(appraisee_id: params[:format], is_confirm_appraiser: true)

  end
  # def send_email_to_appraiser
  #   @employee = Employee.find(params[:id])
  #   @attribute_rating_sheet = AttributeRatingSheet.find_by_appraisee_id(@employee.id)
  #   @employee_attribute = EmployeeAttribute.where(employee_id: @employee.id)

  #   AttributeRatingSheetMailer.send_email_to_appraiser(@attribute_rating_sheet).deliver_now
  #   flash[:notice] = "Email sent Successfully"
  #   redirect_to new_attribute_rating_sheet_path
  # end

  # def send_email_to_appraiser2
  #   @employee = Employee.find(params[:format])
  #   @attribute_rating_sheet = AttributeRatingSheet.find_by_appraisee_id(@employee.id)
  #   @employee_attribute = EmployeeAttribute.where(employee_id: @employee.id)

  #   AttributeRatingSheetMailer.send_email_to_appraiser2(@attribute_rating_sheet).deliver_now
  #   flash[:notice] = "Email sent Successfully"
  #   redirect_to appraiser_attribute_rating_sheets_path(@employee.id)
  # end

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
