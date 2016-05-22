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
  end

  # GET /travel_expence_types/1/edit
  def edit
  end

  # POST /travel_expence_types
  # POST /travel_expence_types.json
  def create
    @travel_expence_type = TravelExpenceType.new(travel_expence_type_params)

    respond_to do |format|
      if @travel_expence_type.save
        format.html { redirect_to @travel_expence_type, notice: 'Travel expence type was successfully created.' }
        format.json { render :show, status: :created, location: @travel_expence_type }
      else
        format.html { render :new }
        format.json { render json: @travel_expence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_expence_types/1
  # PATCH/PUT /travel_expence_types/1.json
  def update
    respond_to do |format|
      if @travel_expence_type.update(travel_expence_type_params)
        format.html { redirect_to @travel_expence_type, notice: 'Travel expence type was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_expence_type }
      else
        format.html { render :edit }
        format.json { render json: @travel_expence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_expence_types/1
  # DELETE /travel_expence_types/1.json
  def destroy
    @travel_expence_type.destroy
    respond_to do |format|
      format.html { redirect_to travel_expence_types_url, notice: 'Travel expence type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_expence_type
      @travel_expence_type = TravelExpenceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_expence_type_params
      params.require(:travel_expence_type).permit(:code, :name, :description)
    end
end
