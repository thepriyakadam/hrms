class CertificateMastersController < ApplicationController
  before_action :set_certificate_master, only: [:show, :edit, :update, :destroy]

  # GET /certificate_masters
  # GET /certificate_masters.json
  def index
    @certificate_master = CertificateMaster.new
    @certificate_masters = CertificateMaster.all
  end

  # GET /certificate_masters/1
  # GET /certificate_masters/1.json
  def show
  end

  # GET /certificate_masters/new
  def new
    @certificate_master = CertificateMaster.new
    @certificate_masters = CertificateMaster.all
    session[:active_tab] ="EmployeeManagement"
  end

  # GET /certificate_masters/1/edit
  def edit
  end

  # POST /certificate_masters
  # POST /certificate_masters.json
  def create
    @certificate_master = CertificateMaster.new(certificate_master_params)
    @certificate_masters = CertificateMaster.all
    respond_to do |format|
      if @certificate_master.save
         @certificate_master = CertificateMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Certificate Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /certificate_masters/1
  # PATCH/PUT /certificate_masters/1.json
  def update
    @certificate_master.update(certificate_master_params)
    @certificate_masters = CertificateMaster.all
    @certificate_master = CertificateMaster.new
      
  end

  # DELETE /certificate_masters/1
  # DELETE /certificate_masters/1.json
  def destroy
    @certificate_master.destroy
    @certificate_masters = CertificateMaster.all
    
  end

  def is_confirm
    @certificate_master = CertificateMaster.find(params[:certificate_master])
    CertificateMaster.find(@certificate_master.id).update(confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_certificate_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate_master
      @certificate_master = CertificateMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_master_params
      params.require(:certificate_master).permit(:name, :description, :status, :confirm)
    end
end
