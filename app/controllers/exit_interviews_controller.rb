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
    @exit_interviews = ExitInterview.where(employee_id: current_user.employee_id).group(:employee_id)
    session[:active_tab] ="employee_resignation"
    session[:active_tab1] = "resignation"
  end

  # GET /exit_interviews/1/edit
  def edit
  end

  # POST /exit_interviews
  # POST /exit_interviews.json
  def create
   @exit_interview = ExitInterview.new(exit_interview_params)
    @exit_interviews = ExitInterview.all
    respond_to do |format|
      if @exit_interview.save
         @exit_interview = ExitInterview.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /exit_interviews/1
  # PATCH/PUT /exit_interviews/1.json
  def update
   @exit_interview.update(exit_interview_params)
   @exit_interview = ExitInterview.new
   @exit_interviews = ExitInterview.all
  end

  # DELETE /exit_interviews/1
  # DELETE /exit_interviews/1.json
  def destroy
    @exit_interview.destroy
    @exit_interviews = ExitInterview.all
  end

  def print_exit_interview
    @emps = ExitInterview.where(employee_id: current_user.employee_id).group(:employee_id)
    @exit_interviews = ExitInterview.all
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_exit_interview',
        layout: '/layouts/pdf.html.erb',
        :template => 'exit_interviews/print_exit_interview.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
      end
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
