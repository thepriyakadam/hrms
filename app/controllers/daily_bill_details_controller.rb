class DailyBillDetailsController < ApplicationController
  before_action :set_daily_bill_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
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

  # GET /daily_bill_details/new
  def new
    @daily_bill_detail = DailyBillDetail.new
    
    @travel_request = TravelRequest.find(params[:travel_request_id])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)

    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)


    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    session[:active_tab] = "master"
    session[:active_tab1] ="daily_bill_master_setup"
  end

  # GET /daily_bill_details/1/edit
  def edit
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
  end

  # POST /daily_bill_details
  # POST /daily_bill_details.json

  def create
    @daily_bill_detail = DailyBillDetail.new(daily_bill_detail_params)
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
      if @daily_bill_detail.save
        # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
        # @daily_bill_detail.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
        # @daily_bill_detail.update(reporting_master_id: @travel_request.reporting_master_id)
        @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
        # c1 = @daily_bill_details.sum(:travel_expence).to_i
        # TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
        @daily_bill_detail = DailyBillDetail.new
        flash[:notice] = 'Daily Bill Detail saved Successfully.'
      end
      # byebug
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


  # def is_confirm
  #   @travel_request = TravelRequest.find(params[:travel_request_id])
  #   # TravelRequestHistory.where(travel_request_id: @travel_request.id).update_all(daily_bill_status: "true")

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
  #     TravelRequest.where(id: @travel_request.id).update_all(daily_bill_status: "true",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
  #     # @travel_request.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
      
  #     flash[:notice] = "Confirmed Successfully"
  #   end 
  #     redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  #   end
  # end

  def print_daily_bill
    @travel_request = TravelRequest.find(params[:qwe])
    @employee = Employee.find(@travel_request.employee_id)
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @travel_expences = TravelExpence.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    # @reporting_master = ReportingMaster.find(@daily_bill_detail.reporting_master_id)
    # @employee1 = Employee.find(@reporting_master.employee_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)

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
    session[:active_tab] ="travelmgmt" 
  end 

  def daily_bill_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    # @travel_request_hisory = TravelRequestHistory.find(params[:format])
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    @dbl = ReportingMastersTravelRequest.where(travel_request_id: 27).pluck(:status).last
    # @c1 = @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).count
    # for i in 1..c1
       
    # end
    # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_reporting_master_id(params[:format])
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).second
    @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).third
    @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).fourth
    @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).fifth
    # @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first

    
    # @reporting_masters_travel_requests = ReportingMastersTravelRequest.all
    # if @reporting_masters_travel_requests2.status == nil
    #     flash[:notice] = 'Not Yet Approved So pls wait.........'  
    #   elsif @reporting_masters_travel_requests3.status == nil
    #     flash[:notice] = 'Not Yet Approved So pls wait.........'  
    #   elsif @reporting_masters_travel_requests4.status == nil
    #     flash[:notice] = 'Not Yet Approved So pls wait.........'  
    #   elsif @reporting_masters_travel_requests5.status == nil
    #     flash[:notice] = 'Not Yet Approved So pls wait.........'  
    #   else
      @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id,is_confirm: :true)
    # end
    
    
    # @daily_bill_details = DailyBillDetail.where(reporting_master_id: reporting_masters,travel_request_id: @travel_request.id,is_confirm: true)
    # @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id,is_confirm: true)
    session[:active_tab] ="travelmgmt"
  end

  def approve_and_send_next

  end

  def approved_daily_bill_details
    @daily_bill_details = DailyBillDetail.where(request_status: "Approved")
    session[:active_tab] ="travelmgmt"
  end

  def download_doc
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.avatar_file.path,
              filename: @daily_bill_detail.avatar_file_file_name,
              type: @daily_bill_detail.avatar_file_content_type,
              disposition: 'attachment'
  end

  def download_pics
    @daily_bill_detail = DailyBillDetail.find(params[:id])
    send_file @daily_bill_detail.passport_photo.path,
              filename: @daily_bill_detail.passport_photo_file_name,
              type: @daily_bill_detail.passport_photo_content_type,
              disposition: 'attachment'
  end

   def travel_request_list
     reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     # @travel_requests = TravelRequest.where(daily_bill_status: "true",reporting_master_id: reporting_masters)
     @travel_requests = TravelRequest.where(daily_bill_status: "true",current_status: "Approved",reporting_master_id: reporting_masters)
     # @travel_request_histories = TravelRequestHistory.where(daily_bill_status: "true",reporting_master_id: reporting_masters)
     session[:active_tab] ="travelmgmt"

  end

  def travel_request_history_list
     reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     # @travel_requests = TravelRequest.where(daily_bill_status: "true",reporting_master_id: reporting_masters)
     @travel_request_histories = TravelRequestHistory.where(daily_bill_status: "true",reporting_master_id: reporting_masters)
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
     # @dbl = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:status).last
     # @dbl1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:travel_status).last

     @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[1]
     @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[2]
     @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[3]
     @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[4]
     @reporting_masters_travel_requests6 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[5]
     @reporting_masters_travel_requests7 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[6]
     @reporting_masters_travel_requests8 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[7]
     @reporting_masters_travel_requests9 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[8]

     # @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     #  ReportingMastersTravelRequest.where(id: @travel_request.id,reporting_master_id: @reporting_masters).update_all(travel_status: "Approved")
    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
    # ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Approved & Send Next")

    c1 = @travel_request.total_advance - @travel_request.expense
    DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Approved & Send Next")
    r1=ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:reporting_master_id).last
    
    if ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:status).last == nil  && ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:travel_status).last == "Approved"
      TravelExpence.where(travel_request_id: @travel_request.id).update_all(total_expence_amount: @travel_request.expense,remaining_amount: c1)
      # ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(status: "true",daily_bill_comment: @comment)
      # TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: r1)
    else
      # flash[:notice] = 'Not Yet Approved'
    end
    
    if c1<0
       TravelExpence.where(travel_request_id: @travel_request.id).update_all(employee_amount: c1.abs)
      else
        TravelExpence.where(travel_request_id: @travel_request.id).update_all(company_amount: c1.abs)
    end

     if @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[0]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests1.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      r1=ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).pluck(:reporting_master_id).last
      if @reporting_masters_travel_requests10 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).pluck(:reporting_master_id).first == nil
      # TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: r1)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: r1,daily_bill_status: "true")
      else
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests2.try(:reporting_master_id))
      end
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

     elsif @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[1]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests2.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
     
     elsif @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[2]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests4.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[3]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests4.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests5.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[4]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests5.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests6.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests6 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[5]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests6.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests7.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests7 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[6]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests7.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests8.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      elsif @reporting_masters_travel_requests8 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[7]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests8.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests9.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
 
      elsif @reporting_masters_travel_requests9 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[8]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests9.reporting_master_id).update_all(status: "true",daily_bill_comment: @comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests9.reporting_master_id)
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'

      # elsif @reporting_masters_travel_requests10 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).pluck(:reporting_master_id).first == nil
      # TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: r1)
        # flash[:notice] = 'Reporting Manager Id is Nil'
    else
      flash[:alert] = 'No Reporting Manager is present'
    end
      redirect_to travel_request_list_daily_bill_details_path
  end

  def reject_request
    # byebug
    @travel_request = TravelRequest.find(params[:format])
    # DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Rejected")

    if @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[0]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests1.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

     elsif @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[1]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests2.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'
     
     elsif @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[2]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests4 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[3]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests4.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests5 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[4]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests5.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests6 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[5]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests6.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests7 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[6]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests7.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'

      elsif @reporting_masters_travel_requests8 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[7]
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests8.reporting_master_id).update_all(status: "false")
      flash[:notice] = 'Daily Bill Request Rejected'
 
      elsif @reporting_masters_travel_requests9 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil)[8]
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
    DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: :true)
    c1 = @daily_bill_details.sum(:travel_expence).to_i
    TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: :true,expense: c1)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_bill_detail
      @daily_bill_detail = DailyBillDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_bill_detail_params
      params.require(:daily_bill_detail).permit(:is_confirm, :comment,:avatar_file,:reporting_master_id,:passport_photo,:currency_master_id,:request_status,:travel_expence_type_id, :travel_request_id, :expence_date, :e_place, :travel_expence )
    end
end