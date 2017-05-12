class EmployeeGpsController < ApplicationController
  before_action :set_employee_gp, only: [:show, :edit, :update, :destroy]

  # GET /employee_gps
  # GET /employee_gps.json
  def index
    @employee_gps = EmployeeGp.all
  end

  # GET /employee_gps/1
  # GET /employee_gps/1.json
  def show
  end

  # GET /employee_gps/new
  def new
    @employee_gp = EmployeeGp.new
  end

  # GET /employee_gps/1/edit
  def edit
  end

  # POST /employee_gps
  # POST /employee_gps.json
  def create
    @employee_gp = EmployeeGp.new(employee_gp_params)

    respond_to do |format|
      if @employee_gp.save
        format.html { redirect_to @employee_gp, notice: 'Employee gp was successfully created.' }
        format.json { render :show, status: :created, location: @employee_gp }
      else
        format.html { render :new }
        format.json { render json: @employee_gp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_gps/1
  # PATCH/PUT /employee_gps/1.json
  def update
    respond_to do |format|
      if @employee_gp.update(employee_gp_params)
        format.html { redirect_to @employee_gp, notice: 'Employee gp was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_gp }
      else
        format.html { render :edit }
        format.json { render json: @employee_gp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_gps/1
  # DELETE /employee_gps/1.json
  def destroy
    @employee_gp.destroy
    respond_to do |format|
      format.html { redirect_to employee_gps_url, notice: 'Employee gp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_gp
      @employee_gp = EmployeeGp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_gp_params
      params.require(:employee_gp).permit(:employee_id, :latitude, :longitude, :location, :from_date, :to_date)
    end
end
