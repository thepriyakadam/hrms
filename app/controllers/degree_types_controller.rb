class DegreeTypesController < ApplicationController
  before_action :set_degree_type, only: [:show, :edit, :update, :destroy]

  def new
    @degree_type = DegreeType.new
    @degree_types = DegreeType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Qualification"
  end

  # GET /degree_types/1/edit
  def edit
  end

  # POST /degree_types
  # POST /degree_types.json
  def create
    @degree_type = DegreeType.new(degree_type_params)
    @degree_types = DegreeType.all
    respond_to do |format|
      if @degree_type.save
        @degree_type = DegreeType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Blood Group Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /degree_types/1
  # PATCH/PUT /degree_types/1.json
  def update
    @degree_type.update(degree_type_params)
    @degree_types = DegreeType.all
    @degree_type = DegreeType.new
  end

  # DELETE /degree_types/1
  # DELETE /degree_types/1.json
  def destroy
    @degree_type.destroy
    @degree_types = DegreeType.all
  end

  def is_confirm
    @degree_type = DegreeType.find(params[:degree_type])
    DegreeType.find(@degree_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_degree_type_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_degree_type
    @degree_type = DegreeType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def degree_type_params
    params.require(:degree_type).permit(:is_confirm,:name,:code,:description)
  end
end
