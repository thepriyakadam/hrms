class AccidentRecordsController < ApplicationController
  before_action :set_accident_record, only: [:show, :edit, :update, :destroy]

  # GET /accident_records
  # GET /accident_records.json
  def index
    @accident_records = AccidentRecord.all
    session[:active_tab] ="safety"
  end

  # GET /accident_records/1
  # GET /accident_records/1.json
  def show
    @accident_record = AccidentRecord.find(params[:id])
  end

  # GET /accident_records/new
  def new
    @accident_record = AccidentRecord.new
  end

  # GET /accident_records/1/edit
  def edit
    @employee = @accident_record.employee
  end

  # POST /accident_records
  # POST /accident_records.json
  def create
    # byebug
    # @employee = Employee.find(params[:accident_record][:employee_id])
    @accident_record = AccidentRecord.new(accident_record_params)
    respond_to do |format|
      if @accident_record.save
        # len = params['accident_record'].length - 2
        #  for i in 2..len
        #   AccidentRecord.create(employee_id: params['accident_record']['employee_id'], avatar: params['accident_record'][i.to_s]['avatar'])
        #   end
          # @accident_records = @employee.accident_records
          flash[:notice] = 'Photo Added successfully created'
        # @employee = AccidentRecord.find(id: employee_id)
        # @employee1 = Employee.find_by_employee_id(@employee)
        format.html { redirect_to @accident_record, notice: 'Accident record was successfully created.' }
        format.json { render :show, status: :created, location: @accident_record }
      else
        format.html { render :new }
        format.json { render json: @accident_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accident_records/1
  # PATCH/PUT /accident_records/1.json
  def update
    # @accident_record = AccidentRecord.find(params['accident_record']['employee_id'])
    respond_to do |format|
      if @accident_record.update(accident_record_params)
        format.html { redirect_to @accident_record, notice: 'Accident record was successfully updated.' }
        format.json { render :show, status: :ok, location: @accident_record }
      else
        format.html { render :edit }
        format.json { render json: @accident_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accident_records/1
  # DELETE /accident_records/1.json
  def destroy
    @accident_record.destroy
    respond_to do |format|
      format.html { redirect_to accident_records_url, notice: 'Accident record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_esic
    @employee = Employee.find(params[:id])
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @esic_no = @joining_detail.employee_efic_no
    @department_id = @employee.department.name
  end

  def download_jpg
    @accident_record = AccidentRecord.find(params[:id])
    if File.exist?(@accident_record.avatar.path)
    send_file @accident_record.avatar.path,
              filename: @accident_record.avatar_file_name,
              type: @accident_record.avatar_content_type,
              disposition: 'attachment'
              else
    flash[:alert] = "No file found Please contact to Admin!"
    redirect_to accident_records_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accident_record
    @accident_record = AccidentRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def accident_record_params
    params.require(:accident_record).permit(:avatar, :department_id, :root_cause_master_id, :code, :employee_id, :accident_date, :esic_no, :case_type, :type_of_injury, :leave_date_range, :no_of_day, :description)
  end
end
