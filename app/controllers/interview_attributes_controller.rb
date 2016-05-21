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
  end

  # GET /interview_attributes/1/edit
  def edit
  end

  # POST /interview_attributes
  # POST /interview_attributes.json
  def create
    @interview_attribute = InterviewAttribute.new(interview_attribute_params)

    respond_to do |format|
      if @interview_attribute.save
        format.html { redirect_to @interview_attribute, notice: 'Interview attribute was successfully created.' }
        format.json { render :show, status: :created, location: @interview_attribute }
      else
        format.html { render :new }
        format.json { render json: @interview_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_attributes/1
  # PATCH/PUT /interview_attributes/1.json
  def update
    respond_to do |format|
      if @interview_attribute.update(interview_attribute_params)
        format.html { redirect_to @interview_attribute, notice: 'Interview attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_attribute }
      else
        format.html { render :edit }
        format.json { render json: @interview_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_attributes/1
  # DELETE /interview_attributes/1.json
  def destroy
    @interview_attribute.destroy
    respond_to do |format|
      format.html { redirect_to interview_attributes_url, notice: 'Interview attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
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
