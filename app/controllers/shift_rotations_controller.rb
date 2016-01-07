class ShiftRotationsController < ApplicationController
  before_action :set_shift_rotation, only: [:show, :edit, :update, :destroy]

  # GET /shift_rotations
  # GET /shift_rotations.json
  def index
    @shift_rotations = ShiftRotation.all
  end

  # GET /shift_rotations/1
  # GET /shift_rotations/1.json
  def show
  end

  # GET /shift_rotations/new
  def new
    @shift_rotation = ShiftRotation.new
  end

  # GET /shift_rotations/1/edit
  def edit
  end

  # POST /shift_rotations
  # POST /shift_rotations.json
  def create
    @shift_rotation = ShiftRotation.new(shift_rotation_params)

    respond_to do |format|
      if @shift_rotation.save
        format.html { redirect_to @shift_rotation, notice: 'Shift rotation was successfully created.' }
        format.json { render :show, status: :created, location: @shift_rotation }
      else
        format.html { render :new }
        format.json { render json: @shift_rotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_rotations/1
  # PATCH/PUT /shift_rotations/1.json
  def update
    respond_to do |format|
      if @shift_rotation.update(shift_rotation_params)
        format.html { redirect_to @shift_rotation, notice: 'Shift rotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_rotation }
      else
        format.html { render :edit }
        format.json { render json: @shift_rotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_rotations/1
  # DELETE /shift_rotations/1.json
  def destroy
    @shift_rotation.destroy
    respond_to do |format|
      format.html { redirect_to shift_rotations_url, notice: 'Shift rotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_rotation
      @shift_rotation = ShiftRotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_rotation_params
      params.require(:shift_rotation).permit(:company_shift_id, :start_date, :end_date)
    end
end
