class InterviewTypesController < ApplicationController
  before_action :set_interview_type, only: [:show, :edit, :update, :destroy]

  # GET /interview_types
  # GET /interview_types.json
  def index
    @interview_types = InterviewType.all
  end

  # GET /interview_types/1
  # GET /interview_types/1.json
  def show
  end

  # GET /interview_types/new
  def new
    @interview_type = InterviewType.new
    @interview_types = InterviewType.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Recruitment"
  end

  # GET /interview_types/1/edit
  def edit
  end

  # POST /interview_types
  # POST /interview_types.json

  def create
    @interview_type = InterviewType.new(interview_type_params)
    @interview_types = InterviewType.all
    respond_to do |format|
      if @interview_type.save
         @interview_type = InterviewType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Type Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_types/1
  # PATCH/PUT /interview_types/1.json
  def update
    @interview_type.update(interview_type_params)
    @interview_types = InterviewType.all
    @interview_type = InterviewType.new
  end

  # DELETE /interview_types/1
  # DELETE /interview_types/1.json

  def destroy
    @interview_type.destroy
    @interview_types = InterviewType.all
  end

  def is_confirm
    @interview_type = InterviewType.find(params[:interview_type])
    InterviewType.find(@interview_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_interview_type_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_type
      @interview_type = InterviewType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_type_params
      params.require(:interview_type).permit(:is_confirm,:code, :name, :description)
    end
end
