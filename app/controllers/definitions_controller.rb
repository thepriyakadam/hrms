class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show, :edit, :update, :destroy]

  # GET /definitions
  # GET /definitions.json
  def index
    @definitions = Definition.all
  end

  # GET /definitions/1
  # GET /definitions/1.json
  def show
  end

  # GET /definitions/new
  def new
    @definition = Definition.new
    @definitions = Definition.all
  end

  # GET /definitions/1/edit
  def edit
  end

  # POST /definitions
  # POST /definitions.json
  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      @flag = true
      @definition = Definition.new
      @definitions = Definition.all
    else
      @flag = false
    end
  end

  # PATCH/PUT /definitions/1
  # PATCH/PUT /definitions/1.json
  def update
    if @definition.update(definition_params)
      @flag = true
      @definition = Definition.new
      @definitions = Definition.all
    else
      @flag = false
    end
  end

  # DELETE /definitions/1
  # DELETE /definitions/1.json
  def destroy
    @definition.destroy
    respond_to do |format|
      format.html { redirect_to definitions_url, notice: 'Definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_definition
    @definition = Definition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def definition_params
    params.require(:definition).permit(:name)
  end
end
