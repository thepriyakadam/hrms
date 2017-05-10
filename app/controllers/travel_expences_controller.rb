class TravelExpencesController < ApplicationController
  before_action :set_travel_expence, only: [:show, :edit, :update, :destroy]

  # GET /travel_expences
  # GET /travel_expences.json
  def index
    @travel_expences = TravelExpence.all
    session[:active_tab] ="travelmgmt"
  end

  # GET /travel_expences/1
  # GET /travel_expences/1.json
  def show
  end

  # GET /travel_expences/new
  def new
    @travel_expence = TravelExpence.new
  end

  # GET /travel_expences/1/edit
  def edit
  end

  # POST /travel_expences
  # POST /travel_expences.json
  def create
    @travel_expence = TravelExpence.new(travel_expence_params)

    respond_to do |format|
      if @travel_expence.save
        format.html { redirect_to @travel_expence, notice: 'Travel expence was successfully created.' }
        format.json { render :show, status: :created, location: @travel_expence }
      else
        format.html { render :new }
        format.json { render json: @travel_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_expences/1
  # PATCH/PUT /travel_expences/1.json
  def update
    respond_to do |format|
      if @travel_expence.update(travel_expence_params)
        format.html { redirect_to @travel_expence, notice: 'Travel expence was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_expence }
      else
        format.html { render :edit }
        format.json { render json: @travel_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_expences/1
  # DELETE /travel_expences/1.json
  def destroy
    @travel_expence.destroy
    respond_to do |format|
      format.html { redirect_to travel_expences_url, notice: 'Travel expence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_expence
      @travel_expence = TravelExpence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_expence_params
      params.require(:travel_expence).permit(:travel_request_id, :total_advance_amount, :total_expence_amount, :remaining_amount, :employee_amount, :company_amount)
    end
end
