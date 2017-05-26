class LeavCancelledsController < ApplicationController
  before_action :set_leav_cancelled, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /leav_cancelleds
  # GET /leav_cancelleds.json
  def index
    @leav_cancelleds = LeavCancelled.all
  end

  # GET /leav_cancelleds/1
  # GET /leav_cancelleds/1.json
  def show
  end

  # GET /leav_cancelleds/new
  def new
    @leav_cancelled = LeavCancelled.new
  end

  # GET /leav_cancelleds/1/edit
  def edit
  end

  # POST /leav_cancelleds
  # POST /leav_cancelleds.json
  def create
    @leav_cancelled = LeavCancelled.new
    @employee_leav_request = EmployeeLeavRequest.find(params[:format])
    @leav_cancelled.employee_leav_request_id = params[:format]
    @leav_cancelled.cancelled_date = Date.today
    @leav_cancelled.employee_id = @employee_leav_request.employee_id
    if @leav_cancelled.save
      redirect_to employee_leav_requests_path
      flash[:notice] = 'Leave cancelled successfully'
    else
      render 'employee_leav_requests/index'
      flash[:alert] = 'Leave not cancelled successfully'
    end
  end

  # PATCH/PUT /leav_cancelleds/1
  # PATCH/PUT /leav_cancelleds/1.json
  def update
    respond_to do |format|
      if @leav_cancelled.update(leav_cancelled_params)
        format.html { redirect_to @leav_cancelled, notice: 'Leav cancelled was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_cancelled }
      else
        format.html { render :edit }
        format.json { render json: @leav_cancelled.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_cancelleds/1
  # DELETE /leav_cancelleds/1.json
  def destroy
    @leav_cancelled.destroy
    respond_to do |format|
      format.html { redirect_to leav_cancelleds_url, notice: 'Leav cancelled was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leav_cancelled
    @leav_cancelled = LeavCancelled.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def leav_cancelled_params
  #   params.require(:leav_cancelled).permit(:employee_leav_request_id, :employee_id, :cancelled_date)
  # end
end
