class ModesController < ApplicationController
  before_action :set_mode, only: [:show, :edit, :update, :destroy]

  # GET /modes
  # GET /modes.json
  def index
    @modes = Mode.all
    @mode = Mode.new
  end

  def mode_detail
    @modes = Mode.all
    respond_to do |f|
      f.js
      f.xls {render template: 'modes/mode_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'department_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'modes/mode_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  # GET /modes/1
  # GET /modes/1.json
  def show
  end

  # GET /modes/new
  def new
    @modes = Mode.all
    @mode = Mode.new
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /modes/1/edit
  def edit
  end

  # POST /modes
  # POST /modes.json
  def create
    @mode = Mode.new(mode_params)
    @modes = Mode.all
    respond_to do |format|
      if @mode.save
        @mode = Mode.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Mode Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /modes/1
  # PATCH/PUT /modes/1.json
  def update
    @mode.update(mode_params)
    @modes = Mode.all
    @mode = Mode.new
  end

  # DELETE /modes/1
  # DELETE /modes/1.json
  def destroy
    @mode.destroy
    @modes = Mode.all
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_modes_path
      else
     Mode.import(params[:file])
     redirect_to new_mode_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mode
      @mode = Mode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mode_params
      params.require(:mode).permit(:expence_opestion_id, :code, :name, :description, :status)
    end
end
