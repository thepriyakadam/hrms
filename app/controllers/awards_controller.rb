class AwardsController < ApplicationController
  before_action :set_award, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /awards
  # GET /awards.json
  def index
    @awards = Award.all
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
  end

  # GET /awards/new
  def new
    @award = Award.new
  end

  # GET /awards/1/edit
  def edit
    @employee = @award.employee
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = Award.new(award_params)
    @employee = Employee.find(params[:award][:employee_id])
    @year = Year.find(params[:award][:year_id])
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @award.save
          # len = params['award'].length - 3
          # for i in 2..len
          #   Award.create(employee_id: params['award']['employee_id'], award_name: params['award'][i.to_s]['award_name'], year_id: params['award'][i.to_s]['year_id'], award_from: params['award'][i.to_s]['award_from'], description: params['award'][i.to_s]['description'])
          # end

          @awards = Award.where(employee_id: @employee.id)
          EmployeeMailer.award_create(@employee,@award).deliver_now
          format.html { redirect_to @award, notice: 'Award was successfully created.' }
          format.json { render :show, status: :created, location: @award }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @award.errors, status: :unprocessable_entity }
          format.js { @flag = false }
        end
      end
    end
  end
  
  # PATCH/PUT /awards/1
  # PATCH/PUT /awards/1.json
  def update
    @employee = Employee.find(params['award']['employee_id'])
    respond_to do |format|
      if @award.update(award_params)
        # format.html { redirect_to @award, notice: 'Award was successfully updated.' }
        # format.json { render :show, status: :ok, location: @award }
        EmployeeMailer.award_create(@employee,@award).deliver_now
        @awards = @employee.awards
        format.js { @flag = true }
        # EmployeeMailer.award_create(@employee,@award).deliver_now
        
      else
        # format.html { render :edit }
        # format.json { render json: @award.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to awards_url, notice: 'Award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_award
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Reports"
  end

  def award_detail_report
    @location = params[:salary][:company_location_id]
    if current_user.class == Group
      if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @awards = Award.all
      else
        @employees = Employee.where(company_location_id: @location.to_i)
        @awards = Award.where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
          @awards = Award.all
        else
          @employees = Employee.where(company_location_id: @location.to_i)
          @awards = Award.where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        params[:salary][:company_location_id] == '' || params[:salary][:company_location_id].nil?
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @awards = Award.where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @awards = Award.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
     end
  end

  def import_xl   
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_award_awards_path
    else
    Award.import(params[:file])
    redirect_to import_award_awards_path, notice: "File imported."
    end
  end

  def award_modal
    @award = Award.find(params[:format])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_award
    @award = Award.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def award_params
    params.require(:award).permit(:employee_id, :award_name, :year_id, :award_from, :description)
  end
end
