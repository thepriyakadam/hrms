class VacancyRequestStatusesController < ApplicationController
  before_action :set_vacancy_request_status, only: [:show, :edit, :update, :destroy]

  # GET /vacancy_request_statuses
  # GET /vacancy_request_statuses.json
  def index
    @vacancy_request_statuses = VacancyRequestStatus.all
  end

  # GET /vacancy_request_statuses/1
  # GET /vacancy_request_statuses/1.json
  def show
  end

  # GET /vacancy_request_statuses/new
  def new
    @vacancy_request_status = VacancyRequestStatus.new
  end

  # GET /vacancy_request_statuses/1/edit
  def edit
  end

  # POST /vacancy_request_statuses
  # POST /vacancy_request_statuses.json
  def create
    @vacancy_request_status = VacancyRequestStatus.new(vacancy_request_status_params)

    respond_to do |format|
      if @vacancy_request_status.save
        format.html { redirect_to @vacancy_request_status, notice: 'Vacancy request status was successfully created.' }
        format.json { render :show, status: :created, location: @vacancy_request_status }
      else
        format.html { render :new }
        format.json { render json: @vacancy_request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancy_request_statuses/1
  # PATCH/PUT /vacancy_request_statuses/1.json
  def update
    respond_to do |format|
      if @vacancy_request_status.update(vacancy_request_status_params)
        format.html { redirect_to @vacancy_request_status, notice: 'Vacancy request status was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy_request_status }
      else
        format.html { render :edit }
        format.json { render json: @vacancy_request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancy_request_statuses/1
  # DELETE /vacancy_request_statuses/1.json
  def destroy
    @vacancy_request_status.destroy
    respond_to do |format|
      format.html { redirect_to vacancy_request_statuses_url, notice: 'Vacancy request status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy_request_status
      @vacancy_request_status = VacancyRequestStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_request_status_params
      params.require(:vacancy_request_status).permit(:vacancy_request_id, :action_by_id, :status, :action_date)
    end
end
