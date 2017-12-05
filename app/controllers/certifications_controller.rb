class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource
  # GET /certifications
  # GET /certifications.json
  def index
    @certifications = Certification.all
  end

  # GET /certifications/1
  # GET /certifications/1.json
  def show
  end
  

  # GET /certifications/new
  def new
    @certification = Certification.new
  end

  # GET /certifications/1/edit
  def edit
    @employee = @certification.employee
  end

  # POST /certifications
  # POST /certifications.json
  def create
    @certification = Certification.new(certification_params)
    @employee = Employee.find(params[:certification][:employee_id])
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @certification.save
          len = params['certification'].length - 4
          for i in 2..len
            Certification.create(employee_id: params['certification']['employee_id'], name: params['certification'][i.to_s]['name'], year_id: params['certification'][i.to_s]['year_id'], duration: params['certification'][i.to_s]['duration'], description: params['certification'][i.to_s]['description'])
          end
          @certifications = Certification.where(employee_id: @employee.id)
        # EmployeeMailer.certification_create(@employee,@certification).deliver_now
          format.html { redirect_to @certification, notice: 'Certification was successfully created.' }
          format.json { render :show, status: :created, location: @certification }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @certification.errors, status: :unprocessable_entity }
          format.js { @flag = false }
        end
      end
    end
  end

  # PATCH/PUT /certifications/1
  # PATCH/PUT /certifications/1.json
  def update
    @employee = Employee.find(params['certification']['employee_id'])
    respond_to do |format|
      if @certification.update(certification_params)
        # format.html { redirect_to @certification, notice: 'Certification was successfully updated.' }
        # format.json { render :show, status: :ok, location: @certification }
        EmployeeMailer.certification_create(@employee,@certification).deliver_now
        @certifications = @employee.certifications
        format.js { @flag = true }
        # EmployeeMailer.certification_create(@employee,@certification).deliver_now
      else
        # format.html { render :edit }
        # format.json { render json: @certification.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.json
  def destroy
    @certification.destroy
    respond_to do |format|
      format.html { redirect_to certifications_url, notice: 'Certification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def import_xl
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Imports"  
  end

  def import
     # byebug
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_xl_certifications_path
    else
    Certification.import(params[:file])
    redirect_to import_xl_certifications_path, notice: "File imported."
    end
  end

  def certificate_modal
    @certification = Certification.find(params[:format])
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_certification
    @certification = Certification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def certification_params
    params.require(:certification).permit(:employee_id, :name, :year_id, :duration, :description)
  end
end
