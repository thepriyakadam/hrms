class TravelModesController < ApplicationController
  before_action :set_travel_mode, only: [:show, :edit, :update, :destroy]

  # GET /travel_modes
  # GET /travel_modes.json
  def index
    @travel_modes = TravelMode.all
  end

  # GET /travel_modes/1
  # GET /travel_modes/1.json
  def show
  end

  # GET /travel_modes/new
  def new
    @travel_mode = TravelMode.new
  end

  # GET /travel_modes/1/edit
  def edit
  end

  # POST /travel_modes
  # POST /travel_modes.json
  def create
    @travel_mode = TravelMode.new(travel_mode_params)

    respond_to do |format|
      if @travel_mode.save
        format.html { redirect_to @travel_mode, notice: 'Travel mode was successfully created.' }
        format.json { render :show, status: :created, location: @travel_mode }
      else
        format.html { render :new }
        format.json { render json: @travel_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_modes/1
  # PATCH/PUT /travel_modes/1.json
  def update
    respond_to do |format|
      if @travel_mode.update(travel_mode_params)
        format.html { redirect_to @travel_mode, notice: 'Travel mode was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_mode }
      else
        format.html { render :edit }
        format.json { render json: @travel_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_modes/1
  # DELETE /travel_modes/1.json
  def destroy
    @travel_mode.destroy
    respond_to do |format|
      format.html { redirect_to travel_modes_url, notice: 'Travel mode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_mode
      @travel_mode = TravelMode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_mode_params
      params.require(:travel_mode).permit(:code, :name, :description)
    end
end
