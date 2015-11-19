class LeavRequestsController < ApplicationController
  before_action :set_leav_request, only: [:show, :edit, :update, :destroy]

  # GET /leav_requests
  # GET /leav_requests.json
  def index
    @leav_requests = LeavRequest.all
  end

  # GET /leav_requests/1
  # GET /leav_requests/1.json
  def show
  end

  # GET /leav_requests/new
  def new
    @leav_request = LeavRequest.new
  end

  # GET /leav_requests/1/edit
  def edit
  end

  # POST /leav_requests
  # POST /leav_requests.json
  def create
    @leav_request = LeavRequest.new(leav_request_params)

    respond_to do |format|
      if @leav_request.save
        format.html { redirect_to @leav_request, notice: 'Leav request was successfully created.' }
        format.json { render :show, status: :created, location: @leav_request }
      else
        format.html { render :new }
        format.json { render json: @leav_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leav_requests/1
  # PATCH/PUT /leav_requests/1.json
  def update
    respond_to do |format|
      if @leav_request.update(leav_request_params)
        format.html { redirect_to @leav_request, notice: 'Leav request was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_request }
      else
        format.html { render :edit }
        format.json { render json: @leav_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_requests/1
  # DELETE /leav_requests/1.json
  def destroy
    @leav_request.destroy
    respond_to do |format|
      format.html { redirect_to leav_requests_url, notice: 'Leav request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_request
      @leav_request = LeavRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_request_params
      params.require(:leav_request).permit(:leav_type_id, :employee_id, :available_leaves, :leave, :date_from, :date_to, :no_of_days, :reason, :applied_on)
    end
end
