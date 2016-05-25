class ExitInterviewsController < ApplicationController
  before_action :set_exit_interview, only: [:show, :edit, :update, :destroy]

  # GET /exit_interviews
  # GET /exit_interviews.json
  def index
    @exit_interviews = ExitInterview.all
  end

  # GET /exit_interviews/1
  # GET /exit_interviews/1.json
  def show
  end

  # GET /exit_interviews/new
  def new
    @exit_interview = ExitInterview.new
  end

  # GET /exit_interviews/1/edit
  def edit
  end

  # POST /exit_interviews
  # POST /exit_interviews.json
  def create
    @exit_interview = ExitInterview.new(exit_interview_params)

    respond_to do |format|
      if @exit_interview.save
        format.html { redirect_to @exit_interview, notice: 'Exit interview was successfully created.' }
        format.json { render :show, status: :created, location: @exit_interview }
      else
        format.html { render :new }
        format.json { render json: @exit_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exit_interviews/1
  # PATCH/PUT /exit_interviews/1.json
  def update
    respond_to do |format|
      if @exit_interview.update(exit_interview_params)
        format.html { redirect_to @exit_interview, notice: 'Exit interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit_interview }
      else
        format.html { render :edit }
        format.json { render json: @exit_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exit_interviews/1
  # DELETE /exit_interviews/1.json
  def destroy
    @exit_interview.destroy
    respond_to do |format|
      format.html { redirect_to exit_interviews_url, notice: 'Exit interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit_interview
      @exit_interview = ExitInterview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_interview_params
      params.require(:exit_interview).permit(:employee_id, :question_master_id, :answer)
    end
end
