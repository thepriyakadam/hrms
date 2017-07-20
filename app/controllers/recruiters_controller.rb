class RecruitersController < ApplicationController
  before_action :set_recruiter, only: [:show, :edit, :update, :destroy]

  # GET /recruiters
  # GET /recruiters.json
  def index
    @recruiters = Recruiter.all
  end

  # GET /recruiters/1
  # GET /recruiters/1.json
  def show
  end

  # GET /recruiters/new
  def new
    @recruiter = Recruiter.new
    @recruiters = Recruiter.all
  end

  # GET /recruiters/1/edit
  def edit
  end

  # POST /recruiters
  # POST /recruiters.json
  def create
    @recruiter = Recruiter.new(recruiter_params)
    @recruiters = Recruiter.all

    respond_to do |format|
      if @recruiter.save
        @recruiter = Recruiter.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Recruiter Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /recruiters/1
  # PATCH/PUT /recruiters/1.json
  def update
    @recruiter.update(recruiter_params)
    @recruiters = Recruiter.all
    @recruiter = Recruiter.new
  end

  # DELETE /recruiters/1
  # DELETE /recruiters/1.json
  def destroy
    @recruiter.destroy
    @recruiters = Recruiter.all
  end

  def final_approve_modal
    @vacancy_master = VacancyMaster.find(params[:format])
  end

  def final_approve_request
    employee_id = params[:salary][:employee_id]
    target_date = params[:salary][:target_date]
    recruiter = Recruiter.find_by(id: employee_id)
    @vacancy_master = VacancyMaster.find(params[:vacancy_master_id])
    @vacancy_master.update(target_date: target_date.to_date,recruiter_id: recruiter.employee_id,current_status: "FinalApproved",reporting_master_id: current_user.employee_id)
    ReportingMastersVacancyMaster.create(vacancy_master_id: @vacancy_master.id,reporting_master_id: current_user.employee_id,vacancy_status: "FinalApproved")
    ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id).update_all(status: "FinalApproved")
    if @vacancy_master.current_status == "FinalApproved"
      flash[:notice] = 'Vacancy Request Approved Successfully'
      redirect_to final_approval_vacancy_list_vacancy_masters_path
    else
      flash[:notice] = 'Vacancy Request Approved Successfully'
      redirect_to vacancy_history_vacancy_masters_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter
      @recruiter = Recruiter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruiter_params
      params.require(:recruiter).permit(:employee_id, :status)
    end
end
