class LeavAprovedsController < ApplicationController
  before_action :set_leav_aproved, only: [:show, :edit, :update, :destroy]

  # GET /leav_aproveds
  # GET /leav_aproveds.json
  def index
    @leav_aproveds = LeavAproved.all
  end

  # GET /leav_aproveds/1
  # GET /leav_aproveds/1.json
  def show
  end

  # GET /leav_aproveds/new
  def new
    @leav_aproved = LeavAproved.new
  end

  # GET /leav_aproveds/1/edit
  def edit
  end

  # POST /leav_aproveds
  # POST /leav_aproveds.json
  def create
    @leav_aproved = LeavAproved.new
    @leav_aproved.employee_leav_request_id = params[:format]
    @leav_aproved.approved_date = Date.today
    if @leav_aproved.save
      redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
      flash[:notice] = "Leave approved successfully"
    else
      render 'employee_leav_requests/approved_or_rejected_leave_request'
      flash[:alert] = "Leave not approved successfully"
    end
  end

  # PATCH/PUT /leav_aproveds/1
  # PATCH/PUT /leav_aproveds/1.json
  def update
    respond_to do |format|
      if @leav_aproved.update(leav_aproved_params)
        format.html { redirect_to @leav_aproved, notice: 'Leave aproved was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_aproved }
      else
        format.html { render :edit }
        format.json { render json: @leav_aproved.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_aproveds/1
  # DELETE /leav_aproveds/1.json
  def destroy
    @leav_aproved.destroy
    respond_to do |format|
      format.html { redirect_to leav_aproveds_url, notice: 'Leav aproved was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_aproved
      @leav_aproved = LeavAproved.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_aproved_params
      params.require(:leav_aproved).permit(:employee_leav_request_id, :approved_date)
    end
end
