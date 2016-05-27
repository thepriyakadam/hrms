class InterviewAttributesController < ApplicationController
  before_action :set_interview_attribute, only: [:show, :edit, :update, :destroy]

  # GET /interview_attributes
  # GET /interview_attributes.json
  def index
    @interview_attributes = InterviewAttribute.all
  end

  # GET /interview_attributes/1
  # GET /interview_attributes/1.json
  def show
  end

  # GET /interview_attributes/new
  def new
    @interview_attribute = InterviewAttribute.new
    @interview_attributes = InterviewAttribute.all
    session[:active_tab] ="master"
    session[:active_tab1] ="interview_master_setup"
  end

  # GET /interview_attributes/1/edit
  def edit
  end

  # POST /interview_attributes
  # POST /interview_attributes.json
  def create
   @interview_attribute = InterviewAttribute.new(interview_attribute_params)
    @interview_attributes = InterviewAttribute.all
    respond_to do |format|
      if @interview_attribute.save
         @interview_attribute = InterviewAttribute.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_attributes/1
  # PATCH/PUT /interview_attributes/1.json
  def update
   @interview_attribute.update(interview_attribute_params)
    @interview_attributes = InterviewAttribute.all
    @interview_attribute = InterviewAttribute.new
  end

  # DELETE /interview_attributes/1
  # DELETE /interview_attributes/1.json
  def destroy
   @interview_attribute.destroy
    @interview_attributes = InterviewAttribute.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_attribute
      @interview_attribute = InterviewAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_attribute_params
      params.require(:interview_attribute).permit(:code, :name, :description)
    end
end
