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
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events" 
  end

  # GET /circulars/1/edit
  def edit
  end

  # POST /circulars
  # POST /circulars.json

  # def create
  #   # byebug
  #    @circular = Circular.new(circular_params)
  #    @circulars = Circular.all
  #     if @circular.save
  #       @circular = Circular.new
  #     else
  #     redirect_to new_circular_path
  #     flash[:notice] = 'Circular Saved Successfully'   
  #   end
  # end

  
  def create
    # byebug
     @circular = Circular.new(circular_params)
     @circulars = Circular.all
      if @circular.save
        @circular = Circular.new
      end
      flash[:notice] = 'Circular saved Successfully.' 
      redirect_to new_circular_path
        
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

  # def download_company_policy_document
  #   @circular = Circular.find(params[:id])
  #   if File.exist?(@circular.document.path)
  #   send_file @circular.document.path,
  #             filename: @circular.document,
  #             type: @circular.document_content_type,
  #             disposition: 'attachment'
  #   else
  #   flash[:alert] = "No file found Please contact to Admin!"
  #   redirect_to root_url
  #   end
  # end

   def download_company_policy_document
    # byebug
    @circular = Circular.find(params[:id])
    if File.exist?(@circular.document.path)
    send_file @circular.document.path,
              filename: @circular.document_file_name,
              type: @circular.document_content_type,
              disposition: 'attachment'
               else
    flash[:alert] = "No file found Please contact to Admin!"
    redirect_to root_url
    end
    # path = params[:to]
    # render path
    # render 'show'
  end

  def download_documents
    @circular = Circular.find(params[:id])
    if File.exist?(@circular.avatar.path)
    send_file @circular.avatar.path,
              filename: @circular.avatar,
              type: @circular.avatar_content_type,
              disposition: 'inline'
    else
    flash[:alert] = "No file found Please contact to Admin!"
    redirect_to root_url
    end
  end

  def is_confirm
    @circular = Circular.find(params[:circular])
    Circular.find(@circular.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_bank_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circular
      @circular = Circular.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_params
      params.require(:circular).permit(:avatar, :date, :subject,:is_active,:is_confirm,:document)
    end
end
