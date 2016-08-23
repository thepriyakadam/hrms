class CircularsController < ApplicationController
  before_action :set_circular, only: [:show, :edit, :update, :destroy]

  # GET /circulars
  # GET /circulars.json
  def index
    @circulars = Circular.all
  end

  # GET /circulars/1
  # GET /circulars/1.json
  def show
  end

  # GET /circulars/new
  def new
    @circular = Circular.new
    @circulars = Circular.all
    session[:active_tab] = "company"
  end

  # GET /circulars/1/edit
  def edit
  end

  # POST /circulars
  # POST /circulars.json
  def create
     @circular = Circular.new(circular_params)
     @circulars = Circular.all
      if @circular.save
        @circular = Circular.new
      end
      redirect_to new_circular_path
      flash[:notice] = 'Circular Saved Successfully'   
  end



  # PATCH/PUT /circulars/1
  # PATCH/PUT /circulars/1.json
 
  def update
    @circular.update(circular_params)
    @circulars = Circular.all
    @circular = Circular.new
    redirect_to new_circular_path
    flash[:notice] = 'Circular Updated Successfully'   
  end

  # DELETE /circulars/1
  # DELETE /circulars/1.json

  def destroy
    @circular.destroy
    @circulars = Circular.all
  end

  def download_documents
    @circular = Circular.find(params[:id])
    send_file @circular.avatar.path,
              filename: @circular.avatar,
              type: @circular.avatar_content_type,
              disposition: 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circular
      @circular = Circular.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_params
      params.require(:circular).permit(:avatar, :date, :subject)
    end
end
