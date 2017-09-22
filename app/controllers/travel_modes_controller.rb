class TravelModesController < ApplicationController
  before_action :set_travel_mode, only: [:show, :edit, :update, :destroy]

  # GET /travel_modes
  # GET /travel_modes.json
  def index
    @travel_modes = TravelMode.all
  end

  # GET /travel_modes/1
  # GET /travel_modes/1.json
  def show
  end

  # GET /travel_modes/new
  def new
    @travel_mode = TravelMode.new
    @travel_modes = TravelMode.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /travel_modes/1/edit
  def edit
  end

  # POST /travel_modes
  # POST /travel_modes.json
  def create
    @travel_mode = TravelMode.new(travel_mode_params)
    @travel_modes = TravelMode.all
    respond_to do |format|
      if @travel_mode.save
         @travel_mode = TravelMode.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Travel Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /travel_modes/1
  # PATCH/PUT /travel_modes/1.json
  def update
    @travel_mode.update(travel_mode_params)
    @travel_modes = TravelMode.all
    @travel_mode = TravelMode.new
  end

  # DELETE /travel_modes/1
  # DELETE /travel_modes/1.json
  def destroy
    @travel_mode.destroy
    @travel_modes = TravelMode.all
  end

   def travel_mode_master
      @travel_modes = TravelMode.all
      respond_to do |f|
      f.js
      f.xls {render template: 'travel_modes/travel_mode_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'travel_mode_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'travel_modes/travel_mode_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_mode
      @travel_mode = TravelMode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_mode_params
      params.require(:travel_mode).permit(:is_confirm,:code, :name, :description)
    end
end
