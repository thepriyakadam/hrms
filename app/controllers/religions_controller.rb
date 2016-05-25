class ReligionsController < ApplicationController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]

  # GET /religions/new
  def new
    @religion = Religion.new
    @religions = Religion.all
    session[:active_tab] ="master"
    session[:active_tab1] ="employeeprofilesetup"
  end

  # GET /religions/1/edit
  def edit
  end

  # POST /religions
  # POST /religions.json
  def create
    @religion = Religion.new(religion_params)
    @religions = Religion.all
    respond_to do |format|
      if @religion.save
        @religion = Religion.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Religion Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /religions/1
  # PATCH/PUT /religions/1.json
  def update
    @religion.update(religion_params)
    @religions = Religion.all
    @religion = Religion.new
  end

  # DELETE /religions/1
  # DELETE /religions/1.json
  def destroy
    @religion.destroy
    @religions = Religion.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_religion
    @religion = Religion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def religion_params
    params.require(:religion).permit(:name, :code, :description)
  end
end
