class TravelOptionsController < ApplicationController
  before_action :set_travel_option, only: [:show, :edit, :update, :destroy]

  # GET /travel_options
  # GET /travel_options.json
  def index
    @travel_options = TravelOption.all
  end

  # GET /travel_options/1
  # GET /travel_options/1.json
  def show
  end

  # GET /travel_options/new
  def new
    @travel_option = TravelOption.new
    @travel_options = TravelOption.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /travel_options/1/edit
  def edit
  end

  # POST /travel_options
  # POST /travel_options.json
  def create
    @travel_option = TravelOption.new(travel_option_params)
    @travel_options = TravelOption.all
    respond_to do |format|
      if @travel_option.save
        @travel_option = TravelOption.new
       format.js { @flag = true }
      else
        flash.now[:alert] = 'Traveloption Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /travel_options/1
  # PATCH/PUT /travel_options/1.json
  def update
    @travel_option.update(travel_option_params)
     @travel_options = TravelOption.all
     @travel_option = TravelOption.new

  end

  # DELETE /travel_options/1
  # DELETE /travel_options/1.json
  def destroy
    @travel_option.destroy
    @travel_options = TravelOption.all
  end

   def travel_option_master
      @travel_options = TravelOption.all
      respond_to do |f|
      f.js
      f.xls {render template: 'travel_options/travel_option_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'travel_option_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'travel_options/travel_option_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_option
      @travel_option = TravelOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_option_params
      params.require(:travel_option).permit(:is_confirm,:code, :name, :discription)
    end
end
