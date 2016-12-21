class CertificateMastersController < ApplicationController
  before_action :set_certificate_master, only: [:show, :edit, :update, :destroy]

  # GET /certificate_masters
  # GET /certificate_masters.json
  def index
    @certificate_masters = CertificateMaster.all
  end

  # GET /certificate_masters/1
  # GET /certificate_masters/1.json
  def show
  end

  # GET /certificate_masters/new
  def new
    @certificate_master = CertificateMaster.new
  end

  # GET /certificate_masters/1/edit
  def edit
  end

  # POST /certificate_masters
  # POST /certificate_masters.json
  def create
    @certificate_master = CertificateMaster.new(certificate_master_params)

    respond_to do |format|
      if @certificate_master.save
        format.html { redirect_to @certificate_master, notice: 'Certificate master was successfully created.' }
        format.json { render :show, status: :created, location: @certificate_master }
      else
        format.html { render :new }
        format.json { render json: @certificate_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificate_masters/1
  # PATCH/PUT /certificate_masters/1.json
  def update
    respond_to do |format|
      if @certificate_master.update(certificate_master_params)
        format.html { redirect_to @certificate_master, notice: 'Certificate master was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificate_master }
      else
        format.html { render :edit }
        format.json { render json: @certificate_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificate_masters/1
  # DELETE /certificate_masters/1.json
  def destroy
    @certificate_master.destroy
    respond_to do |format|
      format.html { redirect_to certificate_masters_url, notice: 'Certificate master was successfully destroyed.' }
      format.json { head :no_content }
    end
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
