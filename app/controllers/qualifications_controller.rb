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
  def update
    @qualification.update(qualification_params)
    @qualifications = Qualification.all
    @qualification = Qualification.new
  end

  # DELETE /qualifications/1
  # DELETE /qualifications/1.json
  def destroy
    @qualification.destroy
    respond_to do |format|
      format.html { redirect_to qualifications_url, notice: 'Qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def modal
    @qualification = Qualification.find(params[:format])
  end

   def import_xl
    @qualifications = Qualification.all
    respond_to do |format|
    format.html
    format.csv { send_data @qualifications.to_csv }
    format.xls
   end   
  end

  def import
    # byebug
    Qualification.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  def update_qualification
    @qualification = Qualification.find(params[:id])
    @employee = Employee.find(@qualification.employee_id)
    if @qualification.update(qualification_params)
      @qualifications = Qualification.where(employee_id:@employee.id)
      @flag = true
    else
      @qualifications = Qualification.where(employee_id:@employee.id)
      @flag = false 
    end
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
