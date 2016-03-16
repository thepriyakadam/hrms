class LeaveCOffsController < ApplicationController
  before_action :set_leave_c_off, only: [:show, :edit, :update, :destroy]

  # GET /leave_c_offs
  # GET /leave_c_offs.json
  def index
    
  end

  # GET /leave_c_offs/1
  # GET /leave_c_offs/1.json
  def show
  end

  # GET /leave_c_offs/new
  def new
    @leave_c_off = LeaveCOff.new
    if current_user.class == Group
      @leave_c_offs = LeaveCOff.all
    else
      if current_user.role.name == "Company"
        @leave_c_offs = LeaveCOff.all
      elsif current_user.role.name == "CompanyLocation"
        @leave_c_offs = LeaveCOff.where(company_location_id: current_user.company_location_id)
      end
    end
  end

  # GET /leave_c_offs/1/edit
  def edit
  end

  # POST /leave_c_offs
  # POST /leave_c_offs.json
  def create
    @leave_c_off = LeaveCOff.new(leave_c_off_params)
    @leave_c_offs = LeaveCOff.all
    @leave_c_off.save
    @leave_c_off = LeaveCOff.new
  end
        

  # PATCH/PUT /leave_c_offs/1
  # PATCH/PUT /leave_c_offs/1.json
  def update
     @leave_c_off.update(leave_c_off_params)
     @leave_c_offs = LeaveCOff.all
     @leave_c_off = LeaveCOff.new     
  end

  # DELETE /leave_c_offs/1
  # DELETE /leave_c_offs/1.json
  def destroy
    @leave_c_off.destroy
    @leave_c_offs = LeaveCOff.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_c_off
      @leave_c_off = LeaveCOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_c_off_params
      params.require(:leave_c_off).permit(:employee_id, :c_off_date, :c_off_type, :c_off_expire_day, :expiry_status)
    end
end
