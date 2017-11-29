class InterviewTypeMastersController < ApplicationController
  before_action :set_interview_type_master, only: [:show, :edit, :update, :destroy]

  # GET /interview_type_masters
  # GET /interview_type_masters.json
  def index
    @interview_type_master = InterviewTypeMaster.new
    @interview_type_masters = InterviewTypeMaster.all
  end

  # GET /interview_type_masters/1
  # GET /interview_type_masters/1.json
  def show
  end

  # GET /interview_type_masters/new
  def new
    @interview_type_master = InterviewTypeMaster.new
    @interview_type_masters = InterviewTypeMaster.all
  end

  # GET /interview_type_masters/1/edit
  def edit
  end

  # POST /interview_type_masters
  # POST /interview_type_masters.json
  def create
     @interview_type_master = InterviewTypeMaster.new(interview_type_master_params)
    @interview_type_masters = InterviewTypeMaster.all
    respond_to do |format|
      if @interview_type_master.save
         @interview_type_master = InterviewTypeMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_type_masters/1
  # PATCH/PUT /interview_type_masters/1.json
  def update
    @interview_type_master.update(interview_type_master_params)
    @interview_type_masters = InterviewTypeMaster.all
    @interview_type_master = InterviewTypeMaster.new
  end

  # DELETE /interview_type_masters/1
  # DELETE /interview_type_masters/1.json
  def destroy
    @interview_type_master.destroy
    @interview_type_masters = InterviewTypeMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_type_master
      @interview_type_master = InterviewTypeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_type_master_params
      params.require(:interview_type_master).permit(:code, :name, :description)
    end
end
