class AdvanceTypesController < ApplicationController
  before_action :set_advance_type, only: [:show, :edit, :update, :destroy]

  # GET /advance_types
  # GET /advance_types.json
  def index
    @advance_types = AdvanceType.all
  end

  # GET /advance_types/1
  # GET /advance_types/1.json
  def show
  end

  # GET /advance_types/new
  def new
    @advance_type = AdvanceType.new
  end

  # GET /advance_types/1/edit
  def edit
  end

  # POST /advance_types
  # POST /advance_types.json
  def create
    @advance_type = AdvanceType.new(advance_type_params)

    respond_to do |format|
      if @advance_type.save
        format.html { redirect_to @advance_type, notice: 'Advance type was successfully created.' }
        format.json { render :show, status: :created, location: @advance_type }
      else
        format.html { render :new }
        format.json { render json: @advance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advance_types/1
  # PATCH/PUT /advance_types/1.json
  def update
    respond_to do |format|
      if @advance_type.update(advance_type_params)
        format.html { redirect_to @advance_type, notice: 'Advance type was successfully updated.' }
        format.json { render :show, status: :ok, location: @advance_type }
      else
        format.html { render :edit }
        format.json { render json: @advance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_types/1
  # DELETE /advance_types/1.json
  def destroy
    @advance_type.destroy
    respond_to do |format|
      format.html { redirect_to advance_types_url, notice: 'Advance type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_type
      @advance_type = AdvanceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advance_type_params
      params.require(:advance_type).permit(:code, :name, :description)
    end
end
