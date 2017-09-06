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

  def employee_wise_gps
  end

  def show_employeewise
  end

  def modal_set_gps
      @from = params[:employee_gp][:from]
      @to = params[:employee_gp][:to]
      @employee_id = params[:employee_gp][:employee_id]
  
  end

 def set_employeewise_gps
    @emp = params[:employee_gp][:employee_id]
    @from = params[:employee_gp][:from]
    @to = params[:employee_gp][:to]

    @latitude = params[:employee_gp][:latitude]
    @longitude = params[:employee_gp][:longitude]
    @location = params[:employee_gp][:location]

    Member.where(employee_id: @emp).update_all(latitude: @latitude,longitude: @longitude,location: @location,is_gps: true)
    member=Member.where(employee_id: @emp).take
    @employee_gp = EmployeeGp.create(employee_id: @emp,latitude: @latitude,longitude: @longitude,location: @location,from_date: @from.to_date,to_date: @to.to_date)
    @gps_history = EmployeeGp.where(member_id: member.id).last(2).first
    EmployeeGp.where(id: @gps_history.id).update_all(to_date: @gps_history.from_date)
      for i in @from.to_date..@to.to_date
        GpsDaily.create(employee_id: @emp,employee_gp_id: @employee_gp.id,latitude: @latitude,longitude: @longitude,location: @location,date: i)
      end
    flash[:notice] = "GPS Setting Saved Successfully"
    redirect_to employee_wise_gps_employee_gps_path
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
