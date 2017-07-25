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
    # byebug
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
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
     @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)
     @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
      if @selected_resume.save
        @selected_resume = SelectedResume.new
        flash[:notice] = 'Resume Details Saved Successfully.'  
      end
      # byebug
      @vacancy_master_id = VacancyMaster.find(params[:selected_resume][:vacancy_master_id])
      redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master_id.id)
  end

  def create_new
    @selected_resume = SelectedResume.new(selected_resume_params)
    respond_to do |format|
      if @selected_resume.save
        format.html { redirect_to @selected_resume, notice: 'Candidate Profile Successfully Created.' }
        format.json { render :show, status: :created, location: @selected_resume }
      else
        format.html { render :new }
        format.json { render json: @selected_resume.errors, status: :unprocessable_entity }
      end
    end
  end

  #   def create
  #    @induction_master = InductionMaster.new(selected_resume_params)
  #    @induction_masters = InductionMaster.all
  #     if @induction_master.save
  #       @induction_master = InductionMaster.new
  #     end
  #     redirect_to new_induction_master_path
  #     flash[:notice] = 'Induction Master saved Successfully.'   
  # end

  # def create
  #   @selected_resume = SelectedResume.new(selected_resume_params)
  #    @selected_resumes = SelectedResume.all
  #   respond_to do |format|
  #     if @selected_resume.save
  #       @selected_resume = SelectedResume.new
  #       format.html { redirect_to @selected_resume, notice: 'Interview schedule was successfully created.' }
  #       format.json { render :show, status: :created, location: @selected_resume }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @selected_resume.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def create
  #   @selected_resume = SelectedResume.new(selected_resume_params)

  #   respond_to do |format|
  #     if @selected_resume.save
  #       format.html { redirect_to @interview_schedule, notice: 'Interview schedule was successfully created.' }
  #       format.json { render :show, status: :created, location: @interview_schedule }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def create_new
  #   @selected_resume = SelectedResume.new(selected_resume_params)
  #   @selected_resumes = SelectedResume.all
  #     if @selected_resume.save
  #       @selected_resume = SelectedResume.new
  #     end
  #     # @vacancy_master = VacancyMaster.find(@selected_resume.vacancy_master_id)
  #     redirect_to root_url
  #     flash[:notice] = 'Resume Details saved Successfully.'  
  # end
  
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
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
    # redirect_to root_url
    flash.now[:alert] = 'Resume Details Destroyed Successfully.'
  end

  def download_resume
    @selected_resume = SelectedResume.find(params[:id])
    send_file @selected_resume.avatar.path,
              filename: @selected_resume.avatar_file_name,
              type: @selected_resume.avatar_content_type,
              disposition: 'inline'
  end

  def download_image
    @selected_resume = SelectedResume.find(params[:id])
    send_file @selected_resume.passport_photo.path,
              filename: @selected_resume.passport_photo_file_name,
              type: @selected_resume.passport_photo_content_type,
              disposition: 'attachment'
  end

  def is_confirm
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resume_ids = params[:selected_resume_ids]
    if @selected_resume_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
    else
      @selected_resume_ids.each do |eid|
      @selected_resume = SelectedResume.find(eid)
      @selected_resume.update(status: "Shortlisted") 
      flash[:notice] = "Confirmed Successfully"
    end 
     redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
   end
  end

  def is_confirm_resume
    @selected_resume_ids = params[:selected_resume_ids]
    if @selected_resume_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to all_resume_list_selected_resumes_path
    else
      @selected_resume_ids.each do |eid|
      @selected_resume = SelectedResume.find(eid)
      @selected_resume.update(status: "Shortlisted") 
      flash[:notice] = "Confirmed Successfully"
    end 
     redirect_to all_resume_list_selected_resumes_path
   end
  end

  def all_resume_list
     @selected_resume = SelectedResume.new
     @selected_resumes = SelectedResume.where(vacancy_master_id: nil)
     # @selected_resumes = SelectedResume.all
     session[:active_tab] ="recruitment"
     session[:active_tab1] ="general_vacancy"
  end

  def offer_letter
      # puts "-----------------"
      # byebug
      # @vacancy_master = VacancyMaster.find(params[:id])
      @selected_resume = SelectedResume.find(params[:id])
      @offer_letter_status = params[:selected_resume][:offer_letter_status]
      #@particular_vacancy_request = ParticularVacancyRequest.where(vacancy_master_id: @particular_vacancy_request.id)
      @selected_resume.update(offer_letter_status: @offer_letter_status)
      flash[:notice] = "Offer Letter Status Updated Successfully"
      redirect_to root_url
  end

  def modal
     @selected_resume = SelectedResume.find(params[:format])
  end

  def modal_change_status
    @selected_resume = SelectedResume.find(params[:format])
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def update_status
    # puts "----------------------------------"
    @selected_resume = SelectedResume.find(params[:id])
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @current_status = params[:selected_resume][:status]
    @selected_resume.update(status: @current_status)
    flash[:notice] = "Interview Status Updated Successfully"
    redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
  end

  def modal_profile_update
  @selected_resume = SelectedResume.find(params[:format])
  @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
  end

  def update_profile
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @selected_resume = SelectedResume.find(params[:id])
    @selected_resume.update(selected_resume_params)
    flash[:notice] = 'Resume Updated Successfully'
    redirect_to new_selected_resume_path(vacancy_master_id: @vacancy_master.id)
  end

  def part_resume
     @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
     @selected_resumes = SelectedResume.where(vacancy_master_id: @vacancy_master.id)
  end

  def modal_vacancy_dropdown
    @selected_resume = SelectedResume.find(params[:format])
  end

  def update_vacancy
     # byebug
     @selected_resume = SelectedResume.find(params[:id])
     @vacancy_name = params[:selected_resume][:vacancy_master_id]
     SelectedResume.where(id: @selected_resume.id).update_all(vacancy_master_id: @vacancy_name)
     flash[:notice] = 'Vacancy Updated Successfully'
     redirect_to all_resume_list_selected_resumes_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_resume
      @selected_resume = SelectedResume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_resume_params
      params.require(:selected_resume).permit(:name, :contact_no,:contact_no2 ,:avatar, :passport_photo, :job_title, :skillset, :degree_id, :ctc,:current_ctc ,:email_id, :experience, :notice_period, :vacancy_master_id)
    end
end
