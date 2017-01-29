class CaptureResumesController < ApplicationController
  before_action :set_capture_resume, only: [:show, :edit, :update, :destroy]

  # GET /capture_resumes
  # GET /capture_resumes.json
  def index
    @capture_resumes = CaptureResume.all
    # @vacancy_master = VacancyMaster.find(params[:format])
  end

  # GET /capture_resumes/1
  # GET /capture_resumes/1.json
  def show
  end

  # GET /capture_resumes/new
  def new
    #byebug
    @capture_resume = CaptureResume.new
    # @vacancy_master = VacancyMaster.find(params[:format])
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="candidate_regist"
  end



  # GET /capture_resumes/1/edit
  def edit
  end

  # POST /capture_resumes
  # POST /capture_resumes.json
  def create
    @capture_resume = CaptureResume.new(capture_resume_params)

    respond_to do |format|
      if @capture_resume.save
        format.html { redirect_to @capture_resume, notice: 'Candidate Registered Successfully.' }
        format.json { render :show, status: :created, location: @capture_resume }
      else
        format.html { render :new }
        format.json { render json: @capture_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capture_resumes/1
  # PATCH/PUT /capture_resumes/1.json
  def update
    respond_to do |format|
      if @capture_resume.update(capture_resume_params)
        format.html { redirect_to @capture_resume, notice: 'Candidate Registration Details was successfully updated.' }
        format.json { render :show, status: :ok, location: @capture_resume }
      else
        format.html { render :edit }
        format.json { render json: @capture_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capture_resumes/1
  # DELETE /capture_resumes/1.json
  def destroy
    @capture_resume.destroy
    respond_to do |format|
      format.html { redirect_to capture_resumes_url, notice: 'Capture resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def download
    @capture_resume = CaptureResume.find(params[:id])
    send_file @capture_resume.avatar.path,
              filename: @capture_resume.avatar_file_name,
              type: @capture_resume.avatar_content_type,
              disposition: 'attachment'
  end

  def download_photo
    @capture_resume = CaptureResume.find(params[:id])
    send_file @capture_resume.passport_photo.path,
              filename: @capture_resume.passport_photo_file_name,
              type: @capture_resume.passport_photo_content_type,
              disposition: 'attachment'
  end

  def download_resume_page
    @capture_resumes = CaptureResume.all
    session[:active_tab] ="recruitment"
  end  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_capture_resume
    @capture_resume = CaptureResume.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def capture_resume_params
    params.require(:capture_resume).permit(:name_of_candidate, :employee_designation_id,:job_title,:vacancy_master_id,:avatar, :degree_id,:passport_photo,:contact_no, :contact_no2,:email2,:linkedin,:vacancy_master_id,:post_applied, :mode_of_application, :date_of_application, :url, :fax, :street, :country_id, :state_id, :district_id, :city, :zip_code, :current_job_title, :current_employeer, :skill_set, :additional_info, :email, :skype_id, :twitter, :current_salary, :expected_salary, :current_location, :notice_period, :interview_date, :interview_time, :reason, :work_experience, :candidate_call_status)
  end
end
