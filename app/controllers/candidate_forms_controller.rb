class CandidateFormsController < ApplicationController
  before_action :set_candidate_form, only: [:show, :edit, :update, :destroy]

  # GET /candidate_forms
  # GET /candidate_forms.json
  def index
    @candidate_forms = CandidateForm.all
  end

  # GET /candidate_forms/1
  # GET /candidate_forms/1.json
  def show
  end

  # GET /candidate_forms/new
  def new
    @candidate_form = CandidateForm.new
  end

  # GET /candidate_forms/1/edit
  def edit
  end

  # POST /candidate_forms
  # POST /candidate_forms.json
  def create
     # byebug
    @candidate_form = CandidateForm.new(candidate_form_params)
    @vacancy_request = params[:candidate_form][:vacancy_request_id]
    # @vacancy_request = VacancyRequest.find(@candidate_form.vacancy_request_id)
    @candidate_forms = CandidateForm.where(vacancy_request_id: @vacancy_request)

    respond_to do |format|
      if @candidate_form.save
        format.html { redirect_to @candidate_form, notice: 'Candidate form was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_form }
      else
        format.html { render :new }
        format.json { render json: @candidate_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_forms/1
  # PATCH/PUT /candidate_forms/1.json
  def update
    respond_to do |format|
      if @candidate_form.update(candidate_form_params)
        format.html { redirect_to @candidate_form, notice: 'Candidate form was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_form }
      else
        format.html { render :edit }
        format.json { render json: @candidate_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_forms/1
  # DELETE /candidate_forms/1.json
  def destroy
    @candidate_form.destroy
    respond_to do |format|
      format.html { redirect_to candidate_forms_url, notice: 'Candidate form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def document_1
    # byebug
    @candidate_form = CandidateForm.find(params[:id])
    send_file @candidate_form.document1.path,
              filename: @candidate_form.document1_file_name,
              type: @candidate_form.document1_content_type,
              disposition: 'attachment'
    # path = params[:to]
    # render path
    # render 'show'
  end

  def document_2
    @candidate_form = CandidateForm.find(params[:id])
    send_file @candidate_form.document2.path,
              filename: @candidate_form.document2_file_name,
              type: @candidate_form.document2_content_type,
              disposition: 'attachment'
    # path = params[:to]
    # render path
    # render 'show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_form
      @candidate_form = CandidateForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_form_params
      params.require(:candidate_form).permit(:vacancy_request_id, :name, :qualification_id, :skill_set, :contact_no, :email, :candidate_type, :experience, :notice_period, :selected_by_id,:document1,:document2)
    end
end
