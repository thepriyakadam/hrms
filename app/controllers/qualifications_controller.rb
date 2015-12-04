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
  end

  # POST /qualifications
  # POST /qualifications.json
  def create
    @qualification = Qualification.new(qualification_params)
    @employee = Employee.find(params[:qualification][:employee_id])
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @qualification.save
          len = params["qualification"].length-5
          for i in 2..len
            Qualification.create(employee_id: params['qualification']['employee_id'], course: params['qualification'][i.to_s]['course'], marks: params['qualification'][i.to_s]['marks'], passout_year: params['qualification'][i.to_s]['passout_year'], college: params['qualification'][i.to_s]['college'],university: params['qualification'][i.to_s]['university']) 
          end
          format.html { redirect_to @qualification, notice: 'Qualification was successfully created.' }
          format.json { render :show, status: :created, location: @qualification }
        else
          format.html { render :new }
          format.json { render json: @qualification.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /qualifications/1
  # PATCH/PUT /qualifications/1.json
  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        format.html { redirect_to @qualification, notice: 'Qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: @qualification }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:employee_id,:course, :marks, :passout_year,:college,:university)
    end
end
