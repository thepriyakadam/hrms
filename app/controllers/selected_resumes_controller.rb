class SelectedResumesController < ApplicationController
  before_action :set_selected_resume, only: [:show, :edit, :update, :destroy]

  # GET /selected_resumes
  # GET /selected_resumes.json
  def index
    @selected_resumes = SelectedResume.all
  end

  # GET /selected_resumes/1
  # GET /selected_resumes/1.json
  def show
  end

  # GET /selected_resumes/new
  def new
    @selected_resume = SelectedResume.new
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  # GET /selected_resumes/1/edit
  def edit
  end

  # POST /selected_resumes
  # POST /selected_resumes.json
  def create
    @selected_resume = SelectedResume.new(selected_resume_params)

    respond_to do |format|
      if @selected_resume.save
        format.html { redirect_to @selected_resume, notice: 'Selected resume was successfully created.' }
        format.json { render :show, status: :created, location: @selected_resume }
      else
        format.html { render :new }
        format.json { render json: @selected_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selected_resumes/1
  # PATCH/PUT /selected_resumes/1.json
  def update
    respond_to do |format|
      if @selected_resume.update(selected_resume_params)
        format.html { redirect_to @selected_resume, notice: 'Selected resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @selected_resume }
      else
        format.html { render :edit }
        format.json { render json: @selected_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_resumes/1
  # DELETE /selected_resumes/1.json
  def destroy
    @selected_resume.destroy
    respond_to do |format|
      format.html { redirect_to selected_resumes_url, notice: 'Selected resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_resume
      @selected_resume = SelectedResume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_resume_params
      params.require(:selected_resume).permit(:name, :contact_no, :skillset, :degree_id, :ctc, :email_id, :experience, :notice_period, :vacancy_master_id)
    end
end
