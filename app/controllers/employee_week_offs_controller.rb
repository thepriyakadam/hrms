class EmployeeWeekOffsController < ApplicationController
  before_action :set_employee_week_off, only: [:show, :edit, :update, :destroy]

  # GET /employee_week_offs
  # GET /employee_week_offs.json
  def index
    @employee_week_offs = EmployeeWeekOff.all
  end

  # GET /employee_week_offs/1
  # GET /employee_week_offs/1.json
  def show
  end

  # GET /employee_week_offs/new
  def new
    @employee_week_off = EmployeeWeekOff.new
  end

  # GET /employee_week_offs/1/edit
  def edit
  end

  # POST /employee_week_offs
  # POST /employee_week_offs.json
  def create
    @employee_week_off = EmployeeWeekOff.new(employee_week_off_params)

    respond_to do |format|
      if @employee_week_off.save
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully created.' }
        format.json { render :show, status: :created, location: @employee_week_off }
      else
        format.html { render :new }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_week_offs/1
  # PATCH/PUT /employee_week_offs/1.json
  def update
    respond_to do |format|
      if @employee_week_off.update(employee_week_off_params)
        format.html { redirect_to @employee_week_off, notice: 'Employee week off was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_week_off }
      else
        format.html { render :edit }
        format.json { render json: @employee_week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_week_offs/1
  # DELETE /employee_week_offs/1.json
  def destroy
    @employee_week_off.destroy
    respond_to do |format|
      format.html { redirect_to employee_week_offs_url, notice: 'Employee week off was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_week_off
      @employee_week_off = EmployeeWeekOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_week_off_params
      params.require(:employee_week_off).permit(:week_off_master_id, :employee_id, :day, :date, :status, :is_confirm)
    end
end
