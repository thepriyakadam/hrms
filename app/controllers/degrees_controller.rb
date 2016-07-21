class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]

  def new
    @degree = Degree.new
    @degrees = Degree.all
    session[:active_tab] ="master"
    session[:active_tab1] ="qualificationsetup"
  end

  # GET /degrees/1/edit
  def edit
  end

  # POST /degrees
  # POST /degrees.json
  def create
    @degree = Degree.new(degree_params)
    @degrees = Degree.all
    respond_to do |format|
      if @degree.save
        @degree = Degree.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Degree Already Exist.'
        format.js { @flag = false }
      end
    end
 end
  # PATCH/PUT /degrees/1
  # PATCH/PUT /degrees/1.json
  def update
    @degree.update(degree_params)
    @degrees = Degree.all
    @degree = Degree.new
  end

  # DELETE /degrees/1
  # DELETE /degrees/1.json
  def destroy
    @degree.destroy
    @degrees = Degree.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_degree
    @degree = Degree.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def degree_params
    params.require(:degree).permit(:name)
  end
end
