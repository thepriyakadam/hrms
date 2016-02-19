class ExpencessTypesController < ApplicationController
  before_action :set_expencess_type, only: [:show, :edit, :update, :destroy]

  # GET /expencess_types
  # GET /expencess_types.json
  def index
    @expencess_types = ExpencessType.all
  end

  # GET /expencess_types/1
  # GET /expencess_types/1.json
  def show
  end

  # GET /expencess_types/new
  def new
    @expencess_type = ExpencessType.new
  end

  # GET /expencess_types/1/edit
  def edit
  end

  # POST /expencess_types
  # POST /expencess_types.json
  def create
    @expencess_type = ExpencessType.new(expencess_type_params)

    respond_to do |format|
      if @expencess_type.save
        format.html { redirect_to @expencess_type, notice: 'Expencess type was successfully created.' }
        format.json { render :show, status: :created, location: @expencess_type }
      else
        format.html { render :new }
        format.json { render json: @expencess_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expencess_types/1
  # PATCH/PUT /expencess_types/1.json
  def update
    respond_to do |format|
      if @expencess_type.update(expencess_type_params)
        format.html { redirect_to @expencess_type, notice: 'Expencess type was successfully updated.' }
        format.json { render :show, status: :ok, location: @expencess_type }
      else
        format.html { render :edit }
        format.json { render json: @expencess_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expencess_types/1
  # DELETE /expencess_types/1.json
  def destroy
    @expencess_type.destroy
    respond_to do |format|
      format.html { redirect_to expencess_types_url, notice: 'Expencess type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expencess_type
      @expencess_type = ExpencessType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expencess_type_params
      params.require(:expencess_type).permit(:code, :name, :description)
    end
end
