class SkillsetsController < ApplicationController
  before_action :set_skillset, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /skillsets
  # GET /skillsets.json
  def index
    @skillsets = Skillset.all
  end

  # GET /skillsets/1
  # GET /skillsets/1.json
  def show
  end

  # GET /skillsets/new
  def new
    @skillset = Skillset.new
  end

  # GET /skillsets/1/edit
  def edit
    @employee = @skillset.employee
  end

  # POST /skillsets
  # POST /skillsets.json
  def create
    @employee = Employee.find(params[:skillset][:employee_id])
    @skillset = Skillset.new(skillset_params)
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @skillset.save
          len = params['skillset'].length - 2
          for i in 2..len
            Skillset.create(employee_id: params['skillset']['employee_id'], name: params['skillset'][i.to_s]['name'], skill_level: params['skillset'][i.to_s]['skill_level'])
          end
          @skillsets = @employee.skillsets
          EmployeeMailer.skillset_create(@employee,@skillset).deliver_now
          flash[:notice] = 'skillset was successfully created'
          format.html { redirect_to @skillset, notice: 'Skillset was successfully created.' }
          format.json { render :show, status: :created, location: @skillset }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @skillset.errors, status: :unprocessable_entity }
          format.js { @flag = false }
      end
      end
    end
  end

  # PATCH/PUT /skillsets/1
  # PATCH/PUT /skillsets/1.json
  def update
    @employee = Employee.find(params['skillset']['employee_id'])
    respond_to do |format|
      if @skillset.update(skillset_params)
        # format.html { redirect_to @skillset, notice: 'Skillset was successfully updated.' }
        # format.json { render :show, status: :ok, location: @skillset }
        # EmployeeMailer.skillset_create(@employee,@skillset).deliver_now
        @skillsets = @employee.skillsets
        format.js { @flag = true }
        EmployeeMailer.skillset_create(@employee,@skillset).deliver_now
      else
        # format.html { render :edit }
        # format.json { render json: @skillset.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  def import_skillset
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end
  
  def skillset_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @skillsets = Skillset.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @skillsets = Skillset.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @skillsets = Skillset.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @skillsets = Skillset.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @@skillsets = Skillset.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @skillsets = Skillset.where(department_id: current_user.department_id)
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
    redirect_to import_skillset_skillsets_path
    else
    Skillset.import(params[:file])
    redirect_to import_skillset_skillsets_path, notice: "File imported."
    end
  end
  # DELETE /skillsets/1
  # DELETE /skillsets/1.json
  def destroy
    @skillset.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Skillset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_skillset
    @skillset = Skillset.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def skillset_params
    params.require(:skillset).permit(:employee_id, :name, :skill_level)
  end
end
