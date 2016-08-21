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
    @reporting_master = ReportingMaster.find(@daily_bill_detail.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
  end

  # GET /daily_bill_details/new
  def new
    @daily_bill_detail = DailyBillDetail.new
    
    @travel_request = TravelRequest.find(params[:travel_request_id])
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)


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
        # DailyBillDetail.where(id: @daily_bill_detail.id).update_all(e_place: c1)
        c1 = @daily_bill_details.sum(:travel_expence).to_i
        TravelRequest.where(id: @travel_request.id).update_all(expense: c1)
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
    flash.now[:notice] = "Deleted successfully"
  end


  def is_confirm
    @travel_request = TravelRequest.find(params[:travel_request_id])
    @daily_bill_detail_ids = params[:daily_bill_detail_ids]
    if @daily_bill_detail_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
    else
      @daily_bill_detail_ids.each do |did|
      @daily_bill_detail = DailyBillDetail.find(did)
      # @daily_bill_detail.update(is_confirm: true)

      # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where("travel_request_id = ? and (status = ? or status = ?)",@travel_request.id,"Pending","Approved & Send Next").where("(status = ?)","Approved").first
      @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
      @daily_bill_detail.update(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: true)
      
      flash[:notice] = "Confirmed Successfully"
    end 
      redirect_to new_daily_bill_detail_path(travel_request_id: @travel_request.id)
    end
  end

  def print_daily_bill
    @travel_request = TravelRequest.find(params[:qwe])
    @employee = Employee.find(@travel_request.employee_id)
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
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

  # def daily_bill_history
  #   # @daily_bill_details = DailyBillDetail.all
  #   @c1 = ReportingMastersTravelRequest.find_by_travel_request_id(@daily_bill_detail.travel_request_id)
  #   @daily_bill_details = DailyBillDetail.where("travel_request_id = ?",@c1.travel_request_id)
  # end

  def daily_bill_history
    @reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @daily_bill_details = DailyBillDetail.where(reporting_master_id: @reporting_masters,is_confirm: true)
    session[:active_tab] ="travelmgmt" 
  end 

  def daily_bill_request_confirmation
    @travel_request = TravelRequest.find(params[:format])
    reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
    @reporting_master = ReportingMaster.find(@travel_request.reporting_master_id)
    @employee = Employee.find(@reporting_master.employee_id)
    # @c1 = @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).count
    # for i in 1..c1
       
    # end
    # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_reporting_master_id(params[:format])
    @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).second
    # @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first

    # @reporting_masters_travel_requests = ReportingMastersTravelRequest.all
    @daily_bill_details = DailyBillDetail.where(reporting_master_id: reporting_masters,travel_request_id: @travel_request.id,is_confirm: true)
    session[:active_tab] ="travelmgmt" 
  end

  def approve_and_send_next

  end


  # def create_employee_attendance
  #   @employee_ids = params[:employee_ids]
  #   day = params[:employee_attendances][:day]
  #   present = params[:employee_attendances][:present]
  #   #department = params[:employee_attendances][:department_id]

  #   @employee = Employee.where(id: @employee_ids)

  #   if @employee_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #   else
  #     @employee_ids.each do |eid|
  #       @emp = Employee.find_by_id(eid)
  #     EmployeeAttendance.create(employee_id: eid,day: day,present: present,department_id: @emp.department_id, is_confirm: false)  
  #     flash[:notice] = "Created successfully"
  #     end
  #   end
  #   redirect_to new_employee_attendance_path
  # end



  # def approve_request
  #   @daily_bill_detail_ids = params[:daily_bill_detail_ids]
  #   if @daily_bill_detail_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #     redirect_to travel_request_list_daily_bill_details_path
  #   else
  #     @daily_bill_detail_ids.each do |did|
  #     @daily_bill_detail = DailyBillDetail.find(did)
  #     @daily_bill_detail.update(request_status: "Approved") 
  #     flash[:notice] = "Approved Successfully"
  #   end 
  #    redirect_to travel_request_list_daily_bill_details_path
  # end
  # session[:active_tab] ="travelmgmt"
  # end

  

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
     # reporting_masters = ReportingMaster.find_by_employee_id(current_user.employee_id)
     # @travel_requests = TravelRequest.where(reporting_master_id: reporting_masters)
     @travel_requests = TravelRequest.all
  end

  def approve_and_send_next_modal
     @daily_bill_detail = DailyBillDetail.find(params[:format])
     # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_travel_request_id(params[:format])
  end
  

  def approve_n_send_next
      @daily_bill_detail = DailyBillDetail.find(params[:id])
      # byebug
      @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
      @daily_bill_detail.update(request_status: "Approved & Send Next",reporting_master_id: params[:daily_bill_detail][:reporting_master_id])
     # @reporting_masters_travel_request = ReportingMastersTravelRequest.find(@travel_request.travel_request_id)
     # reporting_masters_travel_requests = ReportingMastersTravelRequest.find_by_reporting_master_id()
     # @reporting_masters_travel_request = ReportingMastersTravelRequest.find(@travel_request.employee_id)
      # c2 = @reporting_masters_travel_requests.reporting_master.first.employee.try(:first_name)

      # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first

      # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_reporting_master_id(params[:format])
      # c1 = @reporting_masters_travel_requests
      # c1 = @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).count
      # for i in 1..c1
      # DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)

      # DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
      @reporting_master_id = params[:daily_bill_detail][:reporting_master_id]
      ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).update_all(status: true)
      # flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
      # redirect_to travel_request_list_daily_bill_details_path
      # TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Approved & Send Next")
      # ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: params[:travel_request][:reporting_master_id] , travel_status: "Approved & Send Next")
      flash[:notice] = 'Travel Request Send to Higher Authority for Approval'
      redirect_to travel_history_travel_requests_path
  end


  # def edit_and_send_next
  #    @daily_bill_detail = DailyBillDetail.find(params[:id])
  # end

  # def edit_and_send_next
  #   @daily_bill_detail = DailyBillDetail.find(params[:id])
  #   @daily_bill_detail.update(daily_bill_detail_params)
  #   flash[:notice] = "Updated successfully"
  #   redirect_to travel_request_list_daily_bill_details_path
  # end

  # def edit_and_send_next_modal_submit
  #   @travel_request = TravelRequest.find(params[:id])
  #   @travel_request.update(travel_request_params)
  #   TravelRequestHistory.create(travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id)
  #   ReportingMastersTravelRequest.create(travel_request_id: @  travel_request.id, reporting_master_id: @travel_request.reporting_master_id, travel_status: "Edit & Send Next")
  #   flash[:notice] = "Updated successfully"
  #   redirect_to travel_history_travel_requests_path
  # end

  def comment_modal
     @daily_bill_detail = DailyBillDetail.find(params[:daily_bill_detail_id])
  end

  def update_comment
     # byebug
     @daily_bill_detail = DailyBillDetail.find(params[:daily_bill_detail_id])
     @comment = params[:daily_bill_detail][:comment]
     @daily_bill_detail.update(comment: @comment)
     flash[:notice] = 'Comment Updated Successfully'
     redirect_to daily_bill_request_confirmation_daily_bill_details_path(daily_bill_detail_id: @daily_bill_detail.id)
  end

  def approve_and_send_next
     # byebug
     @daily_bill_detail = DailyBillDetail.find(params[:format])
     # @travel_request = TravelRequest.find(params[:format])
     @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
     # @reporting_masters_travel_request = ReportingMastersTravelRequest.find(@travel_request.travel_request_id)
     # reporting_masters_travel_requests = ReportingMastersTravelRequest.find_by_reporting_master_id()
     # @reporting_masters_travel_request = ReportingMastersTravelRequest.find(@travel_request.employee_id)
      # c2 = @reporting_masters_travel_requests.reporting_master.first.employee.try(:first_name)
     # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)

     # if @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).first
     #  # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).first
     #  DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
     #  ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id).update_all(status: "true")

     if @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).second
      # @reporting_masters_travel_requests1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).second
      DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests1.reporting_master_id)
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests1.reporting_master_id).update_all(status: "true")

     elsif @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).third
      # @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).third
      DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests2.reporting_master_id)
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests2.reporting_master_id).update_all(status: "true")

      elsif @reporting_masters_travel_requests3 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).fourth
      # @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).third
      DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id)
      ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests3.reporting_master_id).update_all(status: "true")
  
    else
      flash[:notice] = 'No Reporting Manager is present'
    #   # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_reporting_master_id(params[:format])
    #   # c1 = @reporting_masters_travel_requests
    #   # c1 = @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).count
    #   # for i in 1..c1
    #   # DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
    #   # DailyBillDetail.where(id: @daily_bill_detail.id).update_all(request_status: "Approved & Send Next",reporting_master_id: @reporting_masters_travel_requests.reporting_master_id)
    #   # ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id).update_all(daily_bill_id: 1)
     end
      flash[:notice] = 'Daily Bill Request Send To Higher Authority For Approval'
      redirect_to travel_request_list_daily_bill_details_path
      # end
      # @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)

      # @reporting_masters_travel_request = ReportingMastersTravelRequest.find_by_travel_request_id(params[:format])
      # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,reporting_master_id: @reporting_masters_travel_request.reporting_master_id).last

      # @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,reporting_master_id: @reporting_masters_travel_request.reporting_master_id).last

  end
  


  # def create
  #   @vacancy_master = VacancyMaster.new(vacancy_master_params)
  #   # @vacancy = Department.find(@vacancy_master.department_id)
  #   # @vacancy_master.company_location_id = @vacancy.company_location_id
  #   @vacancy_master.current_status = "Pending"
  
  #   respond_to do |format|
  #     if @vacancy_master.save
  #       len = @vacancy_master.no_of_position
  #       for i in 1..len
  #       ParticularVacancyRequest.create(vacancy_master_id: @vacancy_master.id,employee_id: @vacancy_master.employee_id,employee_designation_id: @vacancy_master.employee_designation_id,vacancy_name: @vacancy_master.vacancy_name,fulfillment_date: @vacancy_master.vacancy_post_date,status: "Pending")
  #       end
  #       ReportingMastersVacancyMaster.create(reporting_master_id: @vacancy_master.reporting_master_id, vacancy_master_id: @vacancy_master.id, vacancy_status: "Pending")
  #       VacancyMasterMailer.vacancy_request(@vacancy_master).deliver_now
  #       format.html { redirect_to @vacancy_master, notice: 'Vacancy created successfully.' }
  #       format.json { render :show, status: :created, location: @vacancy_master }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @vacancy_master.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def reject_request
  #   @daily_bill_detail_ids = params[:daily_bill_detail_ids]
  #   if @daily_bill_detail_ids.nil?
  #     flash[:alert] = "Please Select the Checkbox"
  #     redirect_to daily_bill_history_daily_bill_details_path
  #   else
  #     @daily_bill_detail_ids.each do |did|
  #     @daily_bill_detail = DailyBillDetail.find(did)
  #     @daily_bill_detail.update(request_status: "Rejected") 
  #     flash[:alert] = "Rejected Successfully"
  #   end 
  #    redirect_to travel_request_list_daily_bill_details_path
  # end
  # session[:active_tab] ="travelmgmt"
  # end

  def approve_request
    # byebug
    @daily_bill_detail = DailyBillDetail.find(params[:format])
    @daily_bill_detail.update(request_status: "Approved")
    flash[:alert] = 'Daily Bill Request Approved'
    redirect_to travel_request_list_daily_bill_details_path
  end

  def reject_request
    # byebug
    @daily_bill_detail = DailyBillDetail.find(params[:format])
    @daily_bill_detail.update(request_status: "Rejected")
    flash[:alert] = 'Daily Bill Request Rejected'
    redirect_to travel_request_list_daily_bill_details_path
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