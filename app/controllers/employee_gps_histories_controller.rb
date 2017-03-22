class EmployeeGpsHistoriesController < ApplicationController
  before_action :set_employee_gps_history, only: [:show, :edit, :update, :destroy]

  # GET /employee_gps_histories
  # GET /employee_gps_histories.json
  def index
    @employee_gps_histories = EmployeeGpsHistory.all
  end

  # GET /employee_gps_histories/1
  # GET /employee_gps_histories/1.json
  def show
  end

  # GET /employee_gps_histories/new
  def new
    @employee_gps_history = EmployeeGpsHistory.new
  end

  # GET /employee_gps_histories/1/edit
  def edit
  end

  # POST /employee_gps_histories
  # POST /employee_gps_histories.json
  def create
    @employee_gps_history = EmployeeGpsHistory.new(employee_gps_history_params)

    respond_to do |format|
      if @employee_gps_history.save
        format.html { redirect_to @employee_gps_history, notice: 'Employee gps history was successfully created.' }
        format.json { render :show, status: :created, location: @employee_gps_history }
      else
        format.html { render :new }
        format.json { render json: @employee_gps_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_gps_histories/1
  # PATCH/PUT /employee_gps_histories/1.json
  def update
    respond_to do |format|
      if @employee_gps_history.update(employee_gps_history_params)
        format.html { redirect_to @employee_gps_history, notice: 'Employee gps history was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_gps_history }
      else
        format.html { render :edit }
        format.json { render json: @employee_gps_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_gps_histories/1
  # DELETE /employee_gps_histories/1.json
  def destroy
    @employee_gps_history.destroy
    respond_to do |format|
      format.html { redirect_to employee_gps_histories_url, notice: 'Employee gps history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_gps_history
      @employee_gps_history = EmployeeGpsHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_gps_history_params
      params.require(:employee_gps_history).permit(:member_id, :latitude, :longitude, :location, :from_date, :to_date)
    end
end
