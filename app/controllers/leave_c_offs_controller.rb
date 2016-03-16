class LeaveCOffsController < ApplicationController
  before_action :set_leave_c_off, only: [:show, :edit, :update, :destroy]

  # GET /leave_c_offs
  # GET /leave_c_offs.json
  def index
    @leave_c_offs = LeaveCOff.all
  end

  # GET /leave_c_offs/1
  # GET /leave_c_offs/1.json
  def show
  end

  # GET /leave_c_offs/new
  def new
    @leave_c_off = LeaveCOff.new
  end

  # GET /leave_c_offs/1/edit
  def edit
  end

  # POST /leave_c_offs
  # POST /leave_c_offs.json
  def create
    @leave_c_off = LeaveCOff.new(leave_c_off_params)

    respond_to do |format|
      if @leave_c_off.save
        format.html { redirect_to @leave_c_off, notice: 'Leave c off was successfully created.' }
        format.json { render :show, status: :created, location: @leave_c_off }
      else
        format.html { render :new }
        format.json { render json: @leave_c_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_c_offs/1
  # PATCH/PUT /leave_c_offs/1.json
  def update
    respond_to do |format|
      if @leave_c_off.update(leave_c_off_params)
        format.html { redirect_to @leave_c_off, notice: 'Leave c off was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_c_off }
      else
        format.html { render :edit }
        format.json { render json: @leave_c_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_c_offs/1
  # DELETE /leave_c_offs/1.json
  def destroy
    @leave_c_off.destroy
    respond_to do |format|
      format.html { redirect_to leave_c_offs_url, notice: 'Leave c off was successfully destroyed.' }
      format.json { head :no_content }
    end
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
