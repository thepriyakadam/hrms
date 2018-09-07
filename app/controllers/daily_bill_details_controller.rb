class DailyBillDetailsController < ApplicationController
  before_action :set_daily_bill_detail, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource
  # GET /daily_bill_details
  # GET /daily_bill_details.json
  def index
    @daily_bill_details = DailyBillDetail.all
  end

  # GET /daily_bill_details/1
  # GET /daily_bill_details/1.json
  def show
    # @reporting_master = ReportingMaster.find(@daily_bill_detail.reporting_master_id)
    # @employee = Employee.find(@reporting_master.employee_id)
  end

  
 def expence_date_report
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "travelrequestreports"
 end
 
  # GET /daily_bill_details/new
  def new
    @daily_bill_detail = DailyBillDetail.new
    
    @travel_request = TravelRequest.find(params[:travel_request_id])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id).order("expence_date ASC")

    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    emp = Employee.find(current_user.employee.id)
    employee_grade = emp.try(:joining_detail).try(:employee_grade).try(:id)
    @expence_master = ExpensesMaster.where(employee_grade_id: employee_grade)

    # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    # @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    # @employee = Employee.find(@reporting_master.employee_id)
    session[:active_tab] = "master"
    session[:active_tab1] ="daily_bill_master_setup"
  end

  # GET /daily_bill_details/1/edit
  def edit
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
  end

  # POST /daily_bill_details
  # POST /daily_bill_details.json

  def create
    travel_request_id = params[:daily_bill_detail][:travel_request_id]
    expence_date = params[:daily_bill_detail][:expence_date]
    e_place = params[:daily_bill_detail][:e_place]
    expence_opestion_id = params[:daily_bill_detail][:expence_opestion_id]
    billing_opestion = params[:daily_bill_detail][:billing_opestion]
    currency_master_id = params[:daily_bill_detail][:currency_master_id]
    travel_expence = params[:daily_bill_detail][:travel_expence]
    mode_id = params[:expenses_master][:mode_id]
    billing_option_id = params[:expenses_master][:billing_option_id]
    avatar_file = params[:daily_bill_detail][:avatar_file]
    passport_photo = params[:daily_bill_detail][:passport_photo]
    @travel_request = TravelRequest.find(travel_request_id)
    @expenc = ExpensesMaster.where(expence_opestion_id: expence_opestion_id, mode_id: mode_id, billing_opestion: billing_opestion, billing_option_id: billing_option_id)
    if @expenc.present?
      min_amount = @expenc.last.min_amount
      max_amount = @expenc.last.max_amount
      t_exp = travel_expence.to_f
      total_ex = t_exp > max_amount
      if total_ex == true
        @daily_bill_detail = DailyBillDetail.create(travel_request_id: travel_request_id, expence_date: expence_date, e_place: e_place, travel_expence: travel_expence, travel_expence_type_id: nil, reporting_master_id: nil, currency_master_id: currency_master_id, avatar_file_file_name: nil, expence_opestion_id: expence_opestion_id, mode_id: mode_id, billing_option_id: billing_option_id, billing_opestion: billing_opestion, avatar_file: avatar_file, passport_photo: passport_photo)
        # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
        # @daily_bill_detail.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
        # @daily_bill_detail.update(reporting_master_id: @travel_request.reporting_master_id)
        @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
        # c1 = @daily_bill_details.sum(:travel_expence).to_i
        # TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
        @daily_bill_detail = DailyBillDetail.new
        flash[:notice] = 'Daily Bill Detail saved Successfully.'
      else
        flash[:notice] = "Please Enter Expense Amount Within #{max_amount} "
      end
    else
      flash[:notice] = "Please Contact to Admin"
    end
    @travel_request_id = TravelRequest.find(params[:daily_bill_detail][:travel_request_id])
    redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request_id.id)
  end

  # PATCH/PUT /daily_bill_details/1
  # PATCH/PUT /daily_bill_details/1.json

  def update
      @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)

      if @daily_bill_detail.update(daily_bill_detail_params)
        @daily_bill_details =  @travel_request.daily_bill_details
        # c1 = @daily_bill_details.sum(:travel_expence).to_i
        # TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
        flash[:notice] = "Updated successfully"
      else
        flash[:alert] = "not updated"
      end
      redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  end


  # DELETE /daily_bill_details/1
  # DELETE /daily_bill_details/1.json
  def destroy
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    @daily_bill_detail.destroy
    flash[:alert] = "Deleted successfully"
    redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  end

   def select_form
    @daily_bill_detail = DailyBillDetail.new
    @employee = Employee.find_by(id: current_user.employee_id)
    @travel_id = params[:travel_id]
    @request_id = params[:request_id]
    @travel_request = TravelRequest.find_by(id: @request_id)
    
      if params[:travel_id] == "1" #travel
        @flag = "first"
      elsif params[:travel_id] == "2" #food
        @flag = "second"
      elsif params[:travel_id] == "3" #laundary
        @flag = "third"
      elsif params[:travel_id] == "4"
        @flag = "forth"
      else
      end
    end

    def modal_expense_edit
      @daily_bill_detail = DailyBillDetail.find(params[:daily_bill_detail])
      @travel_request = TravelRequest.find(params[:travel_request])
    end

    def update_expence
      @daily_bill_detail = DailyBillDetail.find(params[:daily_bill_detail_id])
      @travel_request = TravelRequest.find(params[:travel_request_id])

      @daily_bill_detail.update(daily_bill_detail_params)
      flash[:notice] = "Updated Successfully !"
      redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
    end

  # def is_confirm
  #   @travel_request = TravelRequest.find(params[:travel_request_id])
  #   # TravelRequestHistory.where(travel_request_id: @travel_request.id).update_all(daily_bill_status: true)

  #   @daily_bill_detail_ids = params[:daily_bill_detail_ids]
  #   if @daily_bill_detail_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #     redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  #   else
  #     @daily_bill_detail_ids.each do |did|
  #     @daily_bill_detail = DailyBillDetail.find(did)
  #     # @daily_bill_detail.update(is_confirm: true)

  #     # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where("travel_request_id = ? and (status = ? or status = ?)",@travel_request.id,"Pending","Approved & Send Next").where("(status = ?)","Approved").first
  #     # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
  #     @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[0]
  #     @daily_bill_detail.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: true)
  #     TravelRequest.where(id: @travel_request.id).update_all(daily_bill_status: true,reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
  #     # @travel_request.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
      
  #     flash[:notice] = "Confirmed Successfully"
  #   end 
  #     redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  #   end
  # end

 def print_daily_bill
    @travel_request = TravelRequest.find(params[:qwe])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    @travel_expences = TravelExpence.where(travel_request_id: @travel_request.id)

    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'print_daily_bill',
               layout: 'pdf.html',
               :page_height      => 1000,
               :dpi              => '300',
               :margin           => {:top    => 10, # default 10 (mm)
                          :bottom => 10,
                          :left   => 12,
                          :right  => 12},
               orientation: 'Landscape',
               template: 'daily_bill_details/print_daily_bill.pdf.erb',
              :show_as_html => params[:debug].present?
      end
    end  
  end

  def daily_bill_history
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @daily_bill_details = DailyBillDetail.where(reporting_master_id: @reporting_masters,is_confirm: true)
    # session[:active_tab] ="travelmgmt" 
  end 

  def daily_bill_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    @travel_expence = TravelExpence.find_by(travel_request_id: @travel_request.id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id,is_confirm: true)
    
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false).second
    @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false).third
    @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false).fourth
    @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false).fifth
    #@daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id,is_confirm: :true)
   
    session[:active_tab] ="travelmgmt"
  end


  def approved_daily_bill_details
    @daily_bill_details = DailyBillDetail.where(request_status: "Approved")
    session[:active_tab] = "TravelManagemnt"
    session[:active_tab1] = "expensesclaimprocess"  
  end

  def download_doc
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.avatar_file.path,
              filename: @daily_bill_detail.avatar_file_file_name,
              type: @daily_bill_detail.avatar_file_content_type,
              disposition: 'inline'
  end

  def download_pics
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.passport_photo.path,
              filename: @daily_bill_detail.passport_photo_file_name,
              type: @daily_bill_detail.passport_photo_content_type,
              disposition: 'attachment'
  end

  def all_expence_request
    @travel_requests = TravelRequest.where(is_confirm: true, current_status: "FinalApproved")
  end

  def travel_request_list
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    # @travel_requests = TravelRequest.where(daily_bill_status: true,reporting_master_id: reporting_masters)
    @emp = Employee.find_by(id: current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee = @employees + @employees_ind

    # @travel_requests = TravelRequest.where(daily_bill_status: true,current_status: "Approved",reporting_master_id: @reporting_masters)
    @travel_requests = TravelRequest.where(current_status: "FinalApproved",is_confirm: true,reporting_master_id: current_user.employee_id)
    # @travel_request_histories = TravelRequestHistory.where(daily_bill_status: true,reporting_master_id: reporting_masters)

    # @travel_request_histories = TravelRequestHistory.where(daily_bill_status: true,reporting_master_id: reporting_masters)
    session[:active_tab] ="ManagerSelfService" 
  end

  def travel_request_history_list
     reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     # @travel_requests = TravelRequest.where(daily_bill_status: true,reporting_master_id: reporting_masters)
     @travel_request_histories = TravelRequestHistory.where(daily_bill_status: true,reporting_master_id: reporting_masters)
  end

  def comment_modal
     @travel_request = TravelRequest.find(params[:format])
  end

  # def update_comment
  #    # byebug
  #    @travel_request = TravelRequest.find(params[:travel_request_id])
  #    @comment = params[:daily_bill_detail][:comment]
  #    @daily_bill_detail.update(comment: @comment)
  #    flash[:notice] = 'Comment Updated Successfully'
  #    redirect_to daily_bill_request_confirmation_daily_bill_details_path(daily_bill_detail_id: @daily_bill_detail.id)
  # end

   def approve_and_send_next
     @travel_request = TravelRequest.find(params[:travel_request_id])
     @comment = params[:daily_bill_detail][:comment]
     DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Approved & Send Next")

     @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[1]
     @reporting_masters_travel_requests3_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[2]
     @reporting_masters_travel_requests4_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[3]
     @reporting_masters_travel_requests5_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[4]
     @reporting_masters_travel_requests6_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[5]
     @reporting_masters_travel_requests7_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[6]
     @reporting_masters_travel_requests8_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[7]
     @reporting_masters_travel_requests9_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[8]
     @reporting_masters_travel_requests10_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[9]

     if @reporting_masters_travel_requests2.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests2.id).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests3_new.reporting_master_id)
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests3_new.try(:travel_status))
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

     elsif @reporting_masters_travel_requests3_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests3_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests4_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests4_new.try(:travel_status))
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests4_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests4_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests5_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests5_new.try(:travel_status))
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests5_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests5_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests6_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests6_new.try(:travel_status))
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests6_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests6_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests7_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests7_new.travel_status)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests7_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests7_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests8_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests8_new.travel_status)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
 
      elsif @reporting_masters_travel_requests8_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests8_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests9_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests9_new.travel_status)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
  
      elsif @reporting_masters_travel_requests9_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests9_new.try(:id)).update_all(status: true,daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests10_new.try(:reporting_master_id))
      DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: @reporting_masters_travel_requests10_new.travel_status)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
    else
  end
    # byebug
     # @report = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).last
     #  c1 = @travel_request.total_advance - @travel_request.expense
     #  if @report.status == true  && @report.travel_status == "FinalApproved"
     #    @travel_expence = TravelExpence.create(travel_request_id: @travel_request.id,total_advance_amount: @travel_request.total_advance,total_expence_amount: @travel_request.expense,remaining_amount: c1)
     #  else
     #  end
      
     #  if c1<0
     #     TravelExpence.where(travel_request_id: @travel_request.id).update_all(employee_amount: c1.abs)
     #    else
     #      TravelExpence.where(travel_request_id: @travel_request.id).update_all(company_amount: c1.abs)
     #  end  
      redirect_to travel_request_list_daily_bill_details_path
  end 



  def reject_request
    # byebug
    @travel_request = TravelRequest.find(params[:format])
    # DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Rejected")

    if @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[0]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests1.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

     elsif @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[1]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests2.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'
     
     elsif @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[2]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[3]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests4.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[4]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests5.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests6 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[5]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests6.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests7 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[6]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests7.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests8 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[7]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests8.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'
 
      elsif @reporting_masters_travel_requests9 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: false)[8]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests9.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'
    else
      flash[:alert] = 'No Reporting Manager is present'
    end
    redirect_to travel_request_list_daily_bill_details_path
  end

  def is_confirm
    @travel_request = TravelRequest.find(params[:travel_request_id])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[0]
    @reporting_masters_travel_requests_1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[1] #new code
    @reporting_masters_travel_requests.update(status: true) #new code
    DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: true)
    c1 = @daily_bill_details.sum(:travel_expence).to_i
    TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests_1.reporting_master_id,is_confirm: true,expense: c1)
      
      #byebug
      @travel_req = TravelRequest.find_by(id: @travel_request.id)
       @report = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
      c1 = @travel_request.total_advance - @travel_req.expense
      if @report.status == true  && @report.travel_status == "Pending"
        @travel_expence = TravelExpence.create(travel_request_id: @travel_request.id,total_advance_amount: @travel_request.total_advance,total_expence_amount: @travel_req.expense,remaining_amount: c1)
      else
      end
      if c1<0
         TravelExpence.where(travel_request_id: @travel_request.id).update_all(employee_amount: c1.abs)
        else
          TravelExpence.where(travel_request_id: @travel_request.id).update_all(company_amount: c1.abs)
      end  


    flash[:notice] = "Confirmed Successfully"
    redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)

  end

  def image_modal
     @daily_bill_detail = DailyBillDetail.find(params[:format])
     @daily_bill_details = DailyBillDetail.where(id: @daily_bill_detail.id)
  end

  def print_expence_date_report
      @from = params[:salary] ? params[:salary][:from_date] : params[:from_date]
      @to = params[:salary] ? params[:salary][:to_date] : params[:to_date]
      @company = params[:employee] ? params[:employee][:company_id] : params[:company_id]
      @company_location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
      @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
      # @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
      # @travel_requests = TravelRequest.where(employee_id: @employees)
      # @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
      @detail = DailyBillDetail.where(company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department)
      # @expence_date = DailyBillDetail.where(travel_request_id: @travel_requests).take

      if current_user.class == Group
        if @company == ""
          @employees = Employee.where(status: 'Active').pluck(:id)
          @travel_requests = TravelRequest.where(employee_id: @employees)
          @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
        elsif @company_location == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(employee_id: @employees)
          @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
        elsif  @department == ""
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(employee_id: @employees)
          @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
        else
          @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
          @travel_requests = TravelRequest.where(employee_id: @employees)
          @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
        end
      elsif current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          if @company == ""
            @employees = Employee.where(status: 'Active').pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
          elsif @company_location == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          elsif  @department == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)  
          end
        elsif current_user.role.name == 'Admin'
          if @company == ""
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
          elsif @company_location == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          elsif  @department == ""
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
             @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          end
        elsif current_user.role.name == 'Branch'
          if @company == "" || @company_location == ""
            @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests) 
          end
        elsif current_user.role.name == 'HOD'
          if @company == "" || @company_location == "" || @department == ""
            @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
          else 
            @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @company_location.to_i,department_id: @department.to_i).pluck(:id)
            @travel_requests = TravelRequest.where(employee_id: @employees)
            @daily_bill_details = DailyBillDetail.where(expence_date:  @from.to_date..@to.to_date,travel_request_id: @travel_requests)
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      end

      respond_to do |format|
      format.js
      format.xls {render template: 'daily_bill_details/expence_date_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'expence_date_pdf',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'daily_bill_details/expence_date_pdf.pdf.erb',
              # show_as_html: params[:debug].present?,
              :page_height      => 1000,
              :dpi              => '300',
              :margin           => {:top    => 10, # default 10 (mm)
                            :bottom => 10,
                            :left   => 20,
                            :right  => 20},
              :show_as_html => params[:debug].present?
        end
      end
  end

  def modal_expense_claim_list
    @daily_bill_detail = DailyBillDetail.find(params[:format])
  end

  def modal_travel_request_process
    # byebug
    @travel_request = TravelRequest.find(params[:format])
    # @travel_requests = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:expence_opestion_id, :mode_id, :billing_option_id, :billing_opestion, :is_confirm, :comment,:avatar_file,:reporting_master_id,:passport_photo,:currency_master_id,:request_status,:travel_expence_type_id, :travel_request_id, :expence_date, :e_place, :travel_expence )
    end
end