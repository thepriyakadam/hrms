class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
    @employee = @experience.employee
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @employee = Employee.find(params[:experience][:employee_id])
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @experience.save
          len = params['experience'].length - 7
          for i in 2..len
            Experience.create(employee_id: params['experience']['employee_id'], no_of_year: params['experience'][i.to_s]['no_of_year'], company_name: params['experience'][i.to_s]['company_name'], designation: params['experience'][i.to_s]['designation'], ctc: params['experience'][i.to_s]['ctc'],start_date: params['experience'][i.to_s]['start_date'],end_date: params['experience'][i.to_s]['end_date'],description: params['experience'][i.to_s]['description'])
          end
          @experiences = @employee.experiences
        # EmployeeMailer.experience_create(@employee,@experience).deliver_now
          format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
          format.json { render :show, status: :created, location: @experience }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @experience.errors, status: :unprocessable_entity }
          format.js { @flag = false }
        end
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    @employee = Employee.find(params['experience']['employee_id'])
    respond_to do |format|
      if @experience.update(experience_params)
        # format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        # format.json { render :show, status: :ok, location: @experience }
        EmployeeMailer.experience_create(@employee,@experience).deliver_now

        @experiences = @employee.experiences
        format.js { @flag = true }
        # EmployeeMailer.experience_create(@employee,@experience).deliver_now
      else
        # format.html { render :edit }
        # format.json { render json: @experience.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal_experience
    @experience = Experience.find(params[:format])
  end

  def update_experience
     @experience = Experience.find(params[:id])
     @experience.update(experience_params)
     flash[:notice] = 'Experience Details Updated Successfully'
     redirect_to employees_path
  end

   def import_xl
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="Import"   
  end

  def import
    # byebug
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_xl_experiences_path
    else
    Experience.import(params[:file])
    redirect_to import_xl_experiences_path, notice: "File imported."
    end
  end

  def exp_modal
    @experience = Experience.find(params[:format])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def experience_params
    params.require(:experience).permit(:employee_id, :no_of_year, :company_name, :designation, :ctc,:start_date,:end_date,:description)
  end
end
