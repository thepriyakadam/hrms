class WorkingdaysController < ApplicationController
  before_action :set_workingday, only: [:show, :edit, :update, :destroy]

  # GET /workingdays
  # GET /workingdays.json
  def index
    @workingdays = Workingday.group(:year)
  end

  # GET /workingdays/1
  # GET /workingdays/1.json
  def show
  end

  # GET /workingdays/new
  def new
    @workingday = Workingday.new
  end

  # GET /workingdays/1/edit
  def edit
  end

  # POST /workingdays
  # POST /workingdays.json
  def create
    @workingday = Workingday.new(workingday_params)

    respond_to do |format|
      if @workingday.save
        format.html { redirect_to @workingday, notice: 'Workingday was successfully created.' }
        format.json { render :show, status: :created, location: @workingday }
      else
        format.html { render :new }
        format.json { render json: @workingday.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /workingdays/1
  # PATCH/PUT /workingdays/1.json
  def update
    respond_to do |format|
      if @workingday.update(workingday_params)
        format.html { redirect_to @workingday, notice: 'Workingday was successfully updated.' }
        format.json { render :show, status: :ok, location: @workingday }
      else
        format.html { render :edit }
        format.json { render json: @workingday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workingdays/1
  # DELETE /workingdays/1.json
  def destroy
    @workingday.destroy
    respond_to do |format|
      format.html { redirect_to workingdays_path, notice: 'Workingday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employees
    if current_user.class == Group
      @workingdays = Workingday.where(year: params[:year],month_name: params[:month])
    else
      if current_user.role.name == "Company"
        @workingdays = Workingday.where(year: params[:year],month_name: params[:month])
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year],month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == "Employee"
        @workingdays = Workingday.where(year: params[:year],month_name: params[:month], employee_id: current_user.employee_id)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workingday
      @workingday = Workingday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workingday_params
      params.require(:workingday).permit(:employee_id, :month_name, :year, :day_in_month, :present_day, :total_leave, :holiday_in_month, :week_off_day, :absent_day, :payable_day)
    end
end
