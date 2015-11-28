class SkillsetsController < ApplicationController
  before_action :set_skillset, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /skillsets
  # GET /skillsets.json
  def index
    @skillsets = Skillset.all
  end

  # GET /skillsets/1
  # GET /skillsets/1.json
  def show
  end

  # GET /skillsets/new
  def new
    @skillset = Skillset.new
  end

  # GET /skillsets/1/edit
  def edit
  end

  # POST /skillsets
  # POST /skillsets.json
  def create
    @skillset = Skillset.new(skillset_params)

    respond_to do |format|
      if @skillset.save
        format.html { redirect_to @skillset, notice: 'Skillset was successfully created.' }
        format.json { render :show, status: :created, location: @skillset }
      else
        format.html { render :new }
        format.json { render json: @skillset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skillsets/1
  # PATCH/PUT /skillsets/1.json
  def update
    respond_to do |format|
      if @skillset.update(skillset_params)
        format.html { redirect_to @skillset, notice: 'Skillset was successfully updated.' }
        format.json { render :show, status: :ok, location: @skillset }
      else
        format.html { render :edit }
        format.json { render json: @skillset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skillsets/1
  # DELETE /skillsets/1.json
  def destroy
    @skillset.destroy
    respond_to do |format|
      format.html { redirect_to skillsets_url, notice: 'Skillset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skillset
      @skillset = Skillset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skillset_params
      params.require(:skillset).permit(:employee_id, :name, :skill_level)
    end
end
