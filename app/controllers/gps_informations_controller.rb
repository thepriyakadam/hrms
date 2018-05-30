class GpsInformationsController < ApplicationController
  before_action :set_gps_information, only: [:show, :edit, :update, :destroy]

  # GET /gps_informations
  # GET /gps_informations.json
  def index
    @gps_informations = GpsInformation.all
  end

  def all_emp_list
    gps_informations = GpsInformation.all
    @employee = Employee.where(status: "Active")
    @employees = JoiningDetail.where(employee_id: @employee, gps_track: true)
    session[:active_tab] ="UserAdministration"
  end

  def update_gps_info
    @employee_ids = params[:employee_ids]
    @day = params[:gps_information][:day]
    @to_days = params[:gps_information][:to_days]
    @place = params[:gps_information][:place]
    @radius = params[:gps_information][:radius]
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to all_emp_list_gps_informations_path
    else
      all_dats = (@day.to_date..@to_days.to_date).map{ |date| date.strftime("%b %d %y") }
      all_dats.each do |date|
        @employee_ids.each do |eid|
          current_date = date.to_date
          GpsInformation.create(employee_id: eid, day: current_date, place: @place, radius: @radius)  
        end
      end
      flash[:notice] = "Updated Successfully"
      redirect_to all_emp_list_gps_informations_path
    end
  end

  # GET /gps_informations/1
  # GET /gps_informations/1.json
  def show
  end

  # GET /gps_informations/new
  def new
    @gps_information = GpsInformation.new
  end

  # GET /gps_informations/1/edit
  def edit
  end

  # POST /gps_informations
  # POST /gps_informations.json
  def create
    @gps_information = GpsInformation.new(gps_information_params)

    respond_to do |format|
      if @gps_information.save
        format.html { redirect_to @gps_information, notice: 'Gps information was successfully created.' }
        format.json { render :show, status: :created, location: @gps_information }
      else
        format.html { render :new }
        format.json { render json: @gps_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gps_informations/1
  # PATCH/PUT /gps_informations/1.json
  def update
    respond_to do |format|
      if @gps_information.update(gps_information_params)
        format.html { redirect_to @gps_information, notice: 'Gps information was successfully updated.' }
        format.json { render :show, status: :ok, location: @gps_information }
      else
        format.html { render :edit }
        format.json { render json: @gps_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gps_informations/1
  # DELETE /gps_informations/1.json
  def destroy
    @gps_information.destroy
    respond_to do |format|
      format.html { redirect_to gps_informations_url, notice: 'Gps information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_information
      @gps_information = GpsInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_information_params
      params.require(:gps_information).permit(:employee_id, :day, :longitude, :latitude, :place, :radius, :to_days)
    end
end
