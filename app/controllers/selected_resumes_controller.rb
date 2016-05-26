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
    @vacancy_master = VacancyMaster.find(params[:format])
    # @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
    @selected_resumes = SelectedResume.all
  end

  def new1
    @selected_resume = SelectedResume.new
    session[:active_tab] ="recruitment"
    session[:active_tab1] ="general_vacancy"
  end

  # def index
  #    @selected_resume = SelectedResume.new
  #    @selected_resumes = SelectedResume.where(vacancy_master_id: nil)
  # end


  # GET /selected_resumes/1/edit
  def edit
    @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)
    @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
  end


  def create
    @selected_resume = SelectedResume.new(selected_resume_params)
    @selected_resumes = SelectedResume.all
      if @selected_resume.save
        @selected_resume = SelectedResume.new
        flash[:notice] = 'Resume Details saved Successfully.'   
      end
      # @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)
      redirect_to root_url
  end

  def create_new
    @selected_resume = SelectedResume.new(selected_resume_params)
    @selected_resumes = SelectedResume.all
      if @selected_resume.save
        @selected_resume = SelectedResume.new
        flash[:notice] = 'Resume Details saved Successfully.'
         
      end
      # @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)
      redirect_to root_url
  end
  
  # PATCH/PUT /selected_resumes/1
  # PATCH/PUT /selected_resumes/1.json
 
  def update
    respond_to do |format|
      @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)

      if @selected_resume.update(selected_resume_params)
        
        @selected_resumes =  @vacancy_master.selected_resumes
         format.js { @flag = true }
      else
        format.js { @flag = false }
      end
    end
  end

  # DELETE /selected_resumes/1
  # DELETE /selected_resumes/1.json
  def destroy
    @selected_resume.destroy
    @selected_resumes = SelectedResume.all
    # redirect_to root_url
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

  def is_confirm
    # @vacancy_master = VacancyMaster.find(params[:format])
    @selected_resume_ids = params[:selected_resume_ids]
    if @selected_resume_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @selected_resume_ids.each do |eid|
      @selected_resume = SelectedResume.find(eid)
      @selected_resume.update(is_confirm: true)      
      flash[:notice] = "Confirmed Successfully"
    end 
     redirect_to root_url
  end
  end

  def all_resume_list
     @selected_resume = SelectedResume.new
     @selected_resumes = SelectedResume.where(vacancy_master_id: nil)
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="general_vacancy"
  end

  def offer_letter
      puts "-----------------"
      # byebug
      # @vacancy_master = VacancyMaster.find(params[:id])
      @selected_resume = SelectedResume.find(params[:id])
      @offer_letter_status = params[:selected_resume][:offer_letter_status]
      #@particular_vacancy_request = ParticularVacancyRequest.where(vacancy_master_id: @particular_vacancy_request.id)
      @selected_resume.update(offer_letter_status: @offer_letter_status)
      flash[:notice] = "Offer Letter Status updated Successfully"
      redirect_to root_url
  end

  def modal
     @selected_resume = SelectedResume.find(params[:format])
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
