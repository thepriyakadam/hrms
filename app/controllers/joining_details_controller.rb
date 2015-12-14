class JoiningDetailsController < ApplicationController
  before_action :set_joining_detail, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /joining_details
  # GET /joining_details.json
  def index
    @joining_details = JoiningDetail.all
  end

  # GET /joining_details/1
  # GET /joining_details/1.json
  def show
  end

  # GET /joining_details/new
  def new
    @joining_detail = JoiningDetail.new
    @employee = Employee.find(params[:format])
  end

  # GET /joining_details/1/edit
  def edit
    @employee = @joining_detail.employee
  end

  # POST /joining_details
  # POST /joining_details.json
  def create
    @joining_detail = JoiningDetail.new(joining_detail_params)
    @employee = Employee.find(params[:joining_detail][:employee_id])
    respond_to do |format|
      if @joining_detail.save
        format.html { redirect_to @employee, notice: 'Joining detail was successfully created.' }
        format.json { render :show, status: :created, location: @joining_detail }
      else
        flash.now[:alert] = "Joining Detail exist for this employee"
        format.html { render :new }
        format.json { render json: @joining_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joining_details/1
  # PATCH/PUT /joining_details/1.json
  def update
    respond_to do |format|
      if @joining_detail.update(joining_detail_params)
        # format.html { redirect_to @joining_detail, notice: 'Joining detail was successfully updated.' }
        # format.json { render :show, status: :ok, location: @joining_detail }
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @joining_detail.errors, status: :unprocessable_entity }
        format.js { @flag = true }
      end
    end
  end

  # DELETE /joining_details/1
  # DELETE /joining_details/1.json
  def destroy
    @joining_detail.destroy
    respond_to do |format|
      format.html { redirect_to joining_details_url, notice: 'Joining detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joining_detail
      @joining_detail = JoiningDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joining_detail_params
      params.require(:joining_detail).permit(:employee_id, :joining_date, :reference_from, :admin_hr, :tech_hr, :ctc, :account_no, :employee_grade_id, :confirmation_date, :status, :probation_period, :notice_period, :medical_schem, :employee_designation_id)
    end
end
