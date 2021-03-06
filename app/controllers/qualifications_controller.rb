class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /qualifications
  # GET /qualifications.json
  def index
    @qualifications = Qualification.all
  end

  # GET /qualifications/1
  # GET /qualifications/1.json
  def show
  end

  # GET /qualifications/new
  def new
    @qualification = Qualification.new
  end

  # GET /qualifications/1/edit
  def edit
    @employee = @qualification.employee
  end

  # POST /qualifications
  # POST /qualifications.json
  def create
    @qualification = Qualification.new(qualification_params)
    @employee = Employee.find(params[:qualification][:employee_id])

    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @qualification.save
          len = params['qualification'].length - 7
          for i in 2..len
            Qualification.create(employee_id: params['qualification']['employee_id'], degree_type_id: params['qualification'][i.to_s]['degree_type_id'], degree_id: params['qualification'][i.to_s]['degree_id'], degree_stream_id: params['qualification'][i.to_s]['degree_stream_id'], marks: params['qualification'][i.to_s]['marks'], year_id: params['qualification'][i.to_s]['year_id'], college: params['qualification'][i.to_s]['college'], university_id: params['qualification'][i.to_s]['university_id'])
          end
         EmployeeMailer.qualification_create(@employee,@qualification).deliver_now  
          @qualifications = Qualification.where(employee_id: @employee.id)
          format.html { redirect_to @qualification, notice: 'Qualification was successfully created.' }
          format.json { render :show, status: :created, location: @qualification }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @qualification.errors, status: :unprocessable_entity }
          format.js { @flag = false }
        end
      end
    end
  end

  # PATCH/PUT /qualifications/1
  # PATCH/PUT /qualifications/1.json
  # def update
  #   @qualification.update(qualification_params)
  #   @qualifications = Qualification.all
  #   @qualification = Qualification.new
  # end

   def update
    @employee = Employee.find(params['qualification']['employee_id'])
    respond_to do |format|
      if @qualification.update(qualification_params)
        # format.html { redirect_to @skillset, notice: 'Skillset was successfully updated.' }
        # format.json { render :show, status: :ok, location: @skillset }
        EmployeeMailer.qualification_create(@employee,@qualification).deliver_now  
        @qualifications = @employee.qualifications
        format.js { @flag = true }
         EmployeeMailer.qualification_create(@employee,@qualification).deliver_now  
      else
        # format.html { render :edit }
        # format.json { render json: @skillset.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /qualifications/1
  # DELETE /qualifications/1.json
  def destroy
    @qualification.destroy
    respond_to do |format|
      #format.html { redirect_to qualifications_url, notice: 'Qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal
    @qualification = Qualification.find(params[:format])
  end

  def import_qualification
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def qualification_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @qualifications = Qualification.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @qualifications = Qualification.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @qualifications = Qualification.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @qualifications = Qualification.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @qualifications = Qualification.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @qualifications = Qualification.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
      end
  end

  def import_xl
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Import"  
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_qualification_qualifications_path
    else
    Qualification.import(params[:file])
    redirect_to import_qualification_qualifications_path, notice: "File imported."
    end
  end

  def update_qualification
    @qualification = Qualification.find(params[:id])
    @employee = Employee.find(@qualification.employee_id)
    if @qualification.update(qualification_params)
      @qualifications = Qualification.where(employee_id: @employee.id)
      @flag = true
    else
      @qualifications = Qualification.where(employee_id: @employee.id)
      @flag = false 
    end
  end

  def qualification_modal
    @qualification = Qualification.find(params[:format])
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_qualification
    @qualification = Qualification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def qualification_params
    params.require(:qualification).permit(:employee_id, :degree_type_id, :degree_id, :degree_stream_id, :marks, :year_id, :college, :university_id)
  end
end
