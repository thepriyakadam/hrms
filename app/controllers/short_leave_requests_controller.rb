class ShortLeaveRequestsController < ApplicationController
  before_action :set_short_leave_request, only: [:show, :edit, :update, :destroy]

  # GET /short_leave_requests
  # GET /short_leave_requests.json
  def index
    @short_leave_requests = ShortLeaveRequest.all
  end

  # GET /short_leave_requests/1
  # GET /short_leave_requests/1.json
  def show
  end

  # GET /short_leave_requests/new
  def new
    if params[:employee_id]
      @employee = Employee.find_by(id: params[:employee_id])
    else
      @employee = Employee.find_by(id: current_user.employee_id)
    end

    @manager = @employee.manager_id
    @short_leave_request = ShortLeaveRequest.new
    @short_leave_requests = ShortLeaveRequest.where(employee_id: current_user.employee_id)
  end

  def input_for
    # @employee = Employee.find_by(id: params[:employee_id])
  end

  def collect
    @employee = Employee.find_by_id(params[:collect][:employee_id])
    slr, err = @employee.collect_shortlist_leave params[:collect][:day]
    if err.nil?
      @short_leave_requests = slr
      @flag = true
    else
      @flag = false
      @error = err
    end
  end

  # GET /short_leave_requests/1/edit
  def edit
  end

  # POST /short_leave_requests
  # POST /short_leave_requests.json
  def create
    @short_leave_request = ShortLeaveRequest.new(short_leave_request_params)
    date_string = params[:short_leave_request][:day] + " " + params[:short_leave_request][:out_time] + " " + "+0530"
    if DateTime.parse(date_string) < DateTime.now
      @flag=false
    else
      if @short_leave_request.save
        #shrt_leave = @short_leave_request.save
        emp = Employee.find_by(id: @short_leave_request.employee_id)
        total_hrs =  @short_leave_request.in_time.to_time - @short_leave_request.out_time.to_time
        #working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
        working_hrs = total_hrs/60
        @short_leave_request.update(count: working_hrs,status: "Pending",manager_id: emp.manager_id)

        ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: @short_leave_request.employee_id,
          status: "Pending")

        ShortLeaveMailer.short_leave_request(@short_leave_request).deliver_now

        @short_leave_request = ShortLeaveRequest.new
        @short_leave_requests = ShortLeaveRequest.all
        @flag=true
      else
        @flag=false
      end
    end
  end

  def approve
    @short_leave_request = ShortLeaveRequest.find(params[:format])
    ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: current_user.employee_id,
      status: "Approved")
    @short_leave_request.update(status: "Approved")
    ShortLeaveMailer.short_leave_approval(@short_leave_request).deliver_now

    flash[:notice] = "Short Leave Approved Successfully!"
    redirect_to short_leave_approval_manager_self_services_path
  end

  def reject
    @short_leave_request = ShortLeaveRequest.find(params[:format])
    ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: current_user.employee_id,
      status: "Rejected")
    @short_leave_request.update(status: "Rejected")
    ShortLeaveMailer.short_leave_reject(@short_leave_request).deliver_now

    flash[:alert] = "Short Leave Rejected Successfully!"
    redirect_to short_leave_approval_manager_self_services_path
  end

  def view_request
    @short_leave_request = ShortLeaveRequest.find(params[:format])
  end

  # PATCH/PUT /short_leave_requests/1
  # PATCH/PUT /short_leave_requests/1.json
  def update
    @short_leave_request.update(short_leave_request_params)
    @short_leave_request = ShortLeaveRequest.new
    @short_leave_requests = ShortLeaveRequest.all
  end

  # DELETE /short_leave_requests/1
  # DELETE /short_leave_requests/1.json
  def destroy
    @short_leave_request
    if ShortLeaveApproval.exists?(short_leave_request_id: @short_leave_request.id)
      flash[:alert] = "Record is created ! "
    else
    @short_leave_request.destroy
    @short_leave_requests = ShortLeaveRequest.all
    end
  end

  def show_leave
    @short_leave_request = ShortLeaveRequest.find(params[:format])
  end

  def short_leave_process
  end

  def show_list_for_process
    @from = params[:short_leave_request][:from_date]
    @to = params[:short_leave_request][:to_date]
    @short_leave_requests = ShortLeaveRequest.where(day: @from.to_date..@to.to_date,leave_reason: "Leave",process_done: nil)
  end

  def process_short_leave
    @from = params[:from_date]
    @to = params[:to_date]
    #@short_leave_request_ids = params[:short_leave_request_ids]
    leav_category = LeavCategory.find_by(code: "EL")

    @short_leave_requests = ShortLeaveRequest.where(day: @from.to_date..@to.to_date,leave_reason: "Leave",process_done: nil).group(:employee_id)
    @short_leave_requests.each do |slr|
      @short_leave_request = ShortLeaveRequest.find_by_id(slr)
      employee_leav_balance = EmployeeLeavBalance.where(employee_id: slr.employee_id,leav_category_id: leav_category.id,is_active: true).take
      short_leave_request_monthly = ShortLeaveRequest.where(leave_reason: "Leave",day: @from.to_date..@to.to_date,employee_id: slr.employee_id,process_done: nil)
      count = 0
      short_leave_request_monthly.each do |sl|
        sl_count = sl.count.to_f
        count = count.to_f + sl_count.to_f
        sl_req = ShortLeaveRequest.find_by(id: sl.id).update(process_done: "Done")
      end#do
      count

      short_count = count.to_f/60
      short_count_hr = short_count.to_f/8
      #if short_count.to_f < employee_leav_balance.no_of_leave.to_f
        total_count = employee_leav_balance.no_of_leave.to_f - short_count_hr.to_f
        employee_leav_balance.update(no_of_leave: total_count.round(2))
        @short_leave_request.update(process_done: "Done")
        flash[:notice] = "Processed successfully"
      # else
      #   flash[:alert] = "Leave Balance is less then Total hours"
      # end#count.to_f <
    end
    redirect_to short_leave_process_short_leave_requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_leave_request
      @short_leave_request = ShortLeaveRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_leave_request_params
      params.require(:short_leave_request).permit(:leave_reason,:employee_id, :day, :in_time, :out_time, :description, :manager_id, :status)
    end
end
