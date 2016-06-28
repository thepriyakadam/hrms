class ParticularVacancyRequestsController < ApplicationController
  before_action :set_particular_vacancy_request, only: [:show, :edit, :update, :destroy]

  # GET /particular_vacancy_requests
  # GET /particular_vacancy_requests.json
  def index
    @particular_vacancy_requests = ParticularVacancyRequest.all
  end

  # GET /particular_vacancy_requests/1
  # GET /particular_vacancy_requests/1.json
  def show
  end

  # GET /particular_vacancy_requests/new
  def new
    @particular_vacancy_request = ParticularVacancyRequest.new
  end

  # GET /particular_vacancy_requests/1/edit
  def edit
  end

  # POST /particular_vacancy_requests
  # POST /particular_vacancy_requests.json
  def create
    @particular_vacancy_request = ParticularVacancyRequest.new(particular_vacancy_request_params)

    respond_to do |format|
      if @particular_vacancy_request.save
        format.html { redirect_to @particular_vacancy_request, notice: 'Particular vacancy request was successfully created.' }
        format.json { render :show, status: :created, location: @particular_vacancy_request }
      else
        format.html { render :new }
        format.json { render json: @particular_vacancy_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /particular_vacancy_requests/1
  # PATCH/PUT /particular_vacancy_requests/1.json
  def update
    respond_to do |format|
      if @particular_vacancy_request.update(particular_vacancy_request_params)
        format.html { redirect_to @particular_vacancy_request, notice: 'Particular vacancy request was successfully updated.' }
        format.json { render :show, status: :ok, location: @particular_vacancy_request }
      else
        format.html { render :edit }
        format.json { render json: @particular_vacancy_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /particular_vacancy_requests/1
  # DELETE /particular_vacancy_requests/1.json
  def destroy
    @particular_vacancy_request.destroy
    respond_to do |format|
      format.html { redirect_to particular_vacancy_requests_url, notice: 'Particular vacancy request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_particular_vacancy_request
      @particular_vacancy_request = ParticularVacancyRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def particular_vacancy_request_params
      params.require(:particular_vacancy_request).permit(:vacancy_master_id, :vacancy_history_id, :employee_id, :open_date, :closed_date, :fulfillment_date, :status)
    end
end
