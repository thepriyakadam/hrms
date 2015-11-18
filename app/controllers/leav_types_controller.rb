class LeavTypesController < ApplicationController
  before_action :set_leav_type, only: [:show, :edit, :update, :destroy]

  # GET /leav_types
  # GET /leav_types.json
  def index
    @leav_types = LeavType.all
  end

  # GET /leav_types/1
  # GET /leav_types/1.json
  def show
  end

  # GET /leav_types/new
  def new
    @leav_type = LeavType.new
  end

  # GET /leav_types/1/edit
  def edit
  end

  # POST /leav_types
  # POST /leav_types.json
  def create
    @leav_type = LeavType.new(leav_type_params)

    respond_to do |format|
      if @leav_type.save
        format.html { redirect_to @leav_type, notice: 'Leav type was successfully created.' }
        format.json { render :show, status: :created, location: @leav_type }
      else
        format.html { render :new }
        format.json { render json: @leav_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leav_types/1
  # PATCH/PUT /leav_types/1.json
  def update
    respond_to do |format|
      if @leav_type.update(leav_type_params)
        format.html { redirect_to @leav_type, notice: 'Leav type was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_type }
      else
        format.html { render :edit }
        format.json { render json: @leav_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_types/1
  # DELETE /leav_types/1.json
  def destroy
    @leav_type.destroy
    respond_to do |format|
      format.html { redirect_to leav_types_url, notice: 'Leav type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_type
      @leav_type = LeavType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_type_params
      params.require(:leav_type).permit(:leave_type, :no_of_leave, :leave_expiry_date)
    end
end
