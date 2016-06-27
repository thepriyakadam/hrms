class IllnessTypesController < ApplicationController
  before_action :set_illness_type, only: [:show, :edit, :update, :destroy]

  # GET /illness_types
  # GET /illness_types.json
  def index
    @illness_types = IllnessType.all
  end

  # GET /illness_types/1
  # GET /illness_types/1.json
  def show
  end

  # GET /illness_types/new
  def new
    @illness_type = IllnessType.new
    @illness_types = IllnessType.all
  end

  # GET /illness_types/1/edit
  def edit
  end

  # POST /illness_types
  # POST /illness_types.json
  def create
    @illness_type = IllnessType.new(illness_type_params)
    @illness_types = IllnessType.all

    respond_to do |format|
      if @illness_type.save
         @illness_type = IllnessType.new
        format.json { @flag=true }
      else
        flash.now[:alert] = 'Illness Already exit '
        format.js { @flag=false}
      end
    end
  end

  # PATCH/PUT /illness_types/1
  # PATCH/PUT /illness_types/1.json
  def update
    @illness_type.update(illness_type_params)
    @illness_type = IllnessType.new
    @illness_types = IllnessType.all
  end

  # DELETE /illness_types/1
  # DELETE /illness_types/1.json
  def destroy
    @illness_type.destroy
    @illness_types = IllnessType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_illness_type
      @illness_type = IllnessType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def illness_type_params
      params.require(:illness_type).permit(:code, :name, :description)
    end
end
