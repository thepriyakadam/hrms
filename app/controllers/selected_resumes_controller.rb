class SelectedResumesController < ApplicationController
  before_action :set_selected_resume, only: [:show, :edit, :update, :destroy]

  # GET /selected_resumes
  # GET /selected_resumes.json

  # GET /selected_resumes/1
  # GET /selected_resumes/1.json
  def show
  end

  # GET /selected_resumes/new
  def new
    @selected_resume = SelectedResume.new
    @selected_resumes = SelectedResume.all
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  # GET /selected_resumes/1/edit
  def edit
  end

  # POST /selected_resumes
  # POST /selected_resumes.json
  def create
    @selected_resume = SelectedResume.new(selected_resume_params)
    @selected_resumes = SelectedResume.all
    respond_to do |format|
       if @selected_resume.save
        @selected_resume = SelectedResume.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Resume Details Saved Successfully.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /selected_resumes/1
  # PATCH/PUT /selected_resumes/1.json
  def update
    @selected_resume.update(selected_resume_params)
    @vacancy_master = VacancyMaster.find(params[:format])
    @selected_resumes = SelectedResume.all
    @selected_resume = SelectedResume.new
    flash.now[:notice] = 'Resume Details Updated Successfully.'
  end

  # DELETE /selected_resumes/1
  # DELETE /selected_resumes/1.json
  def destroy
    @selected_resume.destroy
    @selected_resumes = SelectedResume.all
    flash.now[:alert] = 'Resume Details Destroyed Successfully.'
  end
  
  def download_resume
    @selected_resume = SelectedResume.find(params[:id])
    send_file @selected_resume.avatar.path,
              filename: @selected_resume.avatar_file_name,
              type: @selected_resume.avatar_content_type,
              disposition: 'attachment'
  end

  def download_image
    @selected_resume = SelectedResume.find(params[:id])
    send_file @selected_resume.passport_photo.path,
              filename: @selected_resume.passport_photo_file_name,
              type: @selected_resume.passport_photo_content_type,
              disposition: 'attachment'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_resume
      @selected_resume = SelectedResume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_resume_params
      params.require(:selected_resume).permit(:name, :contact_no, :avatar, :passport_photo, :skillset, :degree_id, :ctc, :email_id, :experience, :notice_period, :vacancy_master_id)
    end
end
