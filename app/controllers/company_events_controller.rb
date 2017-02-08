class CompanyEventsController < ApplicationController
  before_action :set_company_event, only: [:show, :edit, :update, :destroy]

  # GET /company_events
  # GET /company_events.json
  def index
    @company_events = CompanyEvent.all
  end

  # GET /company_events/1
  # GET /company_events/1.json
  def show
  end

  # GET /company_events/new
  def new
    @company_event = CompanyEvent.new
    @company_events = CompanyEvent.all
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events" 
  end

  # GET /company_events/1/edit
  def edit
  end

  # POST /company_events
  # POST /company_events.json

  def create
    @company_event = CompanyEvent.new(company_event_params)
      if @company_event.save
        @flag = true
        @company_event = CompanyEvent.new
        @company_events = CompanyEvent.all
      else
        @flag = false
      end
  end

  # PATCH/PUT /company_events/1
  # PATCH/PUT /company_events/1.json
  def update
      if @company_event.update(company_event_params)
        @flag = true
        @company_event = CompanyEvent.new
        @company_events = CompanyEvent.all
      else
        @flag = false
      end
  end

  # DELETE /company_events/1
  # DELETE /company_events/1.json
  def destroy
    @company_event.destroy
    respond_to do |format|
      format.html { redirect_to company_events_url, notice: 'Company event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal_detail_info
    @company_event = CompanyEvent.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_event
      @company_event = CompanyEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_event_params
      params.require(:company_event).permit(:event_name, :event_date, :description, :location, :status, :time)
    end
end
