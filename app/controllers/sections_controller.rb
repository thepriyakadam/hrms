class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @section = Section.new
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
    @sections = Section.all
   session[:active_tab] ="PayrollManagement"
   session[:active_tab1] = "IncomeTax"
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @sections = Section.all
    respond_to do |format|
      if @section.save
         @section = Section.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Section Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    @section.update(section_params)
    @section = Section.new
    @sections = Section.all
       
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    @sections = Section.all
  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:limit,:code, :description, :status)
    end
