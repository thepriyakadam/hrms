class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :edit, :update, :destroy]

  # GET /certificates
  # GET /certificates.json
  def index
    @certificates = Certificate.all
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="certificate"
  end

  # GET /certificates/1/edit
  def edit
  end

  # POST /certificates
  # POST /certificates.json

  def create
    # byebug
    @certificate = Certificate.new(certificate_params)

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @certificate, notice: 'Certificate was successfully created.' }
        format.json { render :show, status: :created, location: @certificate }
      else
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to @certificate, notice: 'Certificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificate }
      else
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to certificates_url, notice: 'Certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def certificate_print
    @employee = Employee.find(params[:salary][:employee_id])
    
    certificate_id = params[:salary][:certificate_master_id]
    certificate = CertificateMaster.find_by(id: certificate_id)
    @certificate = certificate.try(:name)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_params
      params.require(:certificate).permit(:certificate_master_id, :h1_start, :h1_end, :h2_start, :h2_end, :b1_start, :b1_end, :b2_start, :b2_end, :b3_start, :b3_end, :b4_start, :b4_end, :b5_start, :b5_end, :f1_start, :f1_end, :f2_start, :f2_end)
    end
end
