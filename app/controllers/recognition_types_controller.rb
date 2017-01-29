class RecognitionTypesController < ApplicationController
  before_action :set_recognition_type, only: [:show, :edit, :update, :destroy]

  # GET /recognition_types
  # GET /recognition_types.json
  def index
    @recognition_types = RecognitionType.all
  end

  # GET /recognition_types/1
  # GET /recognition_types/1.json
  def show
  end

  # GET /recognition_types/new
  def new
    @recognition_type = RecognitionType.new
    @recognition_types = RecognitionType.all
  end

  # GET /recognition_types/1/edit
  def edit
  end

  # POST /recognition_types
  # POST /recognition_types.json
  def create
    @recognition_type = RecognitionType.new(recognition_type_params)
    @recognition_types = RecognitionType.all

    respond_to do |format|
      if @recognition_type.save
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Recognition Type was Successfully created.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /recognition_types/1
  # PATCH/PUT /recognition_types/1.json
  def update
    @recognition_type.update(recognition_type_params)
    @recognition_type = RecognitionType.new
    @recognition_types = RecognitionType.all
  end

  # DELETE /recognition_types/1
  # DELETE /recognition_types/1.json
  def destroy
    @recognition_type.destroy
    @recognition_types = RecognitionType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recognition_type
      @recognition_type = RecognitionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recognition_type_params
      params.require(:recognition_type).permit(:code, :name, :description, :status)
    end
end
