class TravelExpenceTypesController < ApplicationController
  before_action :set_travel_expence_type, only: [:show, :edit, :update, :destroy]

  # GET /travel_expence_types
  # GET /travel_expence_types.json
  def index
    @travel_expence_types = TravelExpenceType.all
  end

  # GET /travel_expence_types/1
  # GET /travel_expence_types/1.json
  def show
  end

  # GET /travel_expence_types/new
  def new
    @travel_expence_type = TravelExpenceType.new
    @travel_expence_types = TravelExpenceType.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /travel_expence_types/1/edit
  def edit
  end

  # POST /travel_expence_types
  # POST /travel_expence_types.json
  def create
    @travel_expence_type = TravelExpenceType.new(travel_expence_type_params)
    @travel_expence_types = TravelExpenceType.all
    respond_to do |format|
      if @travel_expence_type.save
         @travel_expence_type = TravelExpenceType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Travel Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /travel_expence_types/1
  # PATCH/PUT /travel_expence_types/1.json
  def update
   @travel_expence_type.update(travel_expence_type_params)
    @travel_expence_types = TravelExpenceType.all
    @travel_expence_type = TravelExpenceType.new
  end

  # DELETE /travel_expence_types/1
  # DELETE /travel_expence_types/1.json
  def destroy
   @travel_expence_type.destroy
   @travel_expence_types = TravelExpenceType.all
  end

  def is_confirm
    @travel_expence_type = TravelExpenceType.find(params[:travel_expence_type])
    TravelExpenceType.find(@travel_expence_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_travel_expence_type_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_expence_type
      @travel_expence_type = TravelExpenceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_expence_type_params
      params.require(:travel_expence_type).permit(:is_confirm,:code, :name, :description)
    end
end
