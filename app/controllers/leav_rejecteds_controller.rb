class LeavRejectedsController < ApplicationController
  before_action :set_leav_rejected, only: [:show, :edit, :update, :destroy]

  # GET /leav_rejecteds
  # GET /leav_rejecteds.json
  def index
    @leav_rejecteds = LeavRejected.all
  end

  # GET /leav_rejecteds/1
  # GET /leav_rejecteds/1.json
  def show
  end

  # GET /leav_rejecteds/new
  def new
    @leav_rejected = LeavRejected.new
  end

  # GET /leav_rejecteds/1/edit
  def edit
  end

  # POST /leav_rejecteds
  # POST /leav_rejecteds.json
  def create
    @leav_rejected = LeavRejected.new(leav_rejected_params)

    respond_to do |format|
      if @leav_rejected.save
        format.html { redirect_to @leav_rejected, notice: 'Leav rejected was successfully created.' }
        format.json { render :show, status: :created, location: @leav_rejected }
      else
        format.html { render :new }
        format.json { render json: @leav_rejected.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leav_rejecteds/1
  # PATCH/PUT /leav_rejecteds/1.json
  def update
    respond_to do |format|
      if @leav_rejected.update(leav_rejected_params)
        format.html { redirect_to @leav_rejected, notice: 'Leav rejected was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_rejected }
      else
        format.html { render :edit }
        format.json { render json: @leav_rejected.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_rejecteds/1
  # DELETE /leav_rejecteds/1.json
  def destroy
    @leav_rejected.destroy
    respond_to do |format|
      format.html { redirect_to leav_rejecteds_url, notice: 'Leav rejected was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_rejected
      @leav_rejected = LeavRejected.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_rejected_params
      params.require(:leav_rejected).permit(:employee_leav_request_id, :rejected_date)
    end
end
