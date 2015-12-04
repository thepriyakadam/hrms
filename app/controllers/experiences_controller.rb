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
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @employee = Employee.find(params[:experience][:employee_id])
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end

    def create
    @experience = Experience.new(experience_params)
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @experience.save
          len = params["experience"].length-4
          for i in 2..len
            Experience.create(employee_id: params['experience']['employee_id'],company_name: params['experience'][i.to_s]['company_name'], designation: params['experience'][i.to_s]['designation'], ctc: params['experience'][i.to_s]['ctc']) 
          end
          format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
          format.json { render :show, status: :created, location: @experience }
        else
          format.html { render :new }
          format.json { render json: @@xperince.errors, status: :unprocessable_entity }
        end
      end
    end
end

  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:employee_id, :no_of_year, :company_name, :designation, :ctc)
    end
end
