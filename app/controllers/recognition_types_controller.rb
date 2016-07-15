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
  end

  # GET /recognition_types/1/edit
  def edit
  end

  # POST /recognition_types
  # POST /recognition_types.json
  def create
    @recognition_type = RecognitionType.new(recognition_type_params)

    respond_to do |format|
      if @recognition_type.save
        format.html { redirect_to @recognition_type, notice: 'Recognition type was successfully created.' }
        format.json { render :show, status: :created, location: @recognition_type }
      else
        format.html { render :new }
        format.json { render json: @recognition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recognition_types/1
  # PATCH/PUT /recognition_types/1.json
  def update
    respond_to do |format|
      if @recognition_type.update(recognition_type_params)
        format.html { redirect_to @recognition_type, notice: 'Recognition type was successfully updated.' }
        format.json { render :show, status: :ok, location: @recognition_type }
      else
        format.html { render :edit }
        format.json { render json: @recognition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recognition_types/1
  # DELETE /recognition_types/1.json
  def destroy
    @recognition_type.destroy
    respond_to do |format|
      format.html { redirect_to recognition_types_url, notice: 'Recognition type was successfully destroyed.' }
      format.json { head :no_content }
    end
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
