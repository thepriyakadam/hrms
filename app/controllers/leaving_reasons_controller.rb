class LeavingReasonsController < ApplicationController
  before_action :set_leaving_reason, only: [:show, :edit, :update, :destroy]

  # GET /leaving_reasons
  # GET /leaving_reasons.json
  def index
    @leaving_reasons = LeavingReason.all
  end

  # GET /leaving_reasons/1
  # GET /leaving_reasons/1.json
  def show
  end

  # GET /leaving_reasons/new
  def new
    @leaving_reason = LeavingReason.new
    @leaving_reasons = LeavingReason.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Resignation"
  end

  # GET /leaving_reasons/1/edit
  def edit
  end

  # POST /leaving_reasons
  # POST /leaving_reasons.json
  def create
    @leaving_reason = LeavingReason.new(leaving_reason_params)
    @leaving_reasons = LeavingReason.all
    respond_to do |format|
      if @leaving_reason.save
         @leaving_reason = LeavingReason.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Leaving Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /leaving_reasons/1
  # PATCH/PUT /leaving_reasons/1.json
  def update
   
    @leaving_reason.update(leaving_reason_params)
    @leaving_reasons = LeavingReason.all
    @leaving_reason = LeavingReason.new
  end

  # DELETE /leaving_reasons/1
  # DELETE /leaving_reasons/1.json
  def destroy
    @leaving_reason.destroy
    @leaving_reasons = LeavingReason.all
  end

 def leaving_reason_master
      @leaving_reasons = LeavingReason.all
      respond_to do |f|
      f.js
      f.xls {render template: 'leaving_reasons/leaving_reason_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'leaving_reason_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'leaving_reasons/leaving_reason_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
     end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_leaving_reasons_path
      else
     LeavingReason.import(params[:file])
     redirect_to new_leaving_reason_path, notice: "File imported."
     end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leaving_reason
      @leaving_reason = LeavingReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leaving_reason_params
      params.require(:leaving_reason).permit(:is_confirm,:code, :name, :description)
    end
end
