class InterviewEvalutionsController < ApplicationController
  before_action :set_interview_evalution, only: [:show, :edit, :update, :destroy]

  # GET /interview_evalutions
  # GET /interview_evalutions.json
  def index
    @interview_evalutions = InterviewEvalution.all
  end

  # GET /interview_evalutions/1
  # GET /interview_evalutions/1.json
  def show
  end

  # GET /interview_evalutions/new
  def new
    @interview_evalution = InterviewEvalution.new
    @interview_evalutions = InterviewEvalution.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Recruitment"
  end

  # GET /interview_evalutions/1/edit
  def edit
  end

  # POST /interview_evalutions
  # POST /interview_evalutions.json
  def create
    @interview_evalution = InterviewEvalution.new(interview_evalution_params)
    @interview_evalutions = InterviewEvalution.all
    respond_to do |format|
      if @interview_evalution.save
         @interview_evalution = InterviewEvalution.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end


  # PATCH/PUT /interview_evalutions/1
  # PATCH/PUT /interview_evalutions/1.json
  def update
    @interview_evalution.update(interview_evalution_params)
    @interview_evalutions = InterviewEvalution.all
    @interview_evalution = InterviewEvalution.new
  end
  

  # DELETE /interview_evalutions/1
  # DELETE /interview_evalutions/1.json
  def destroy
    @interview_evalution.destroy
    @interview_evalutions = InterviewEvalution.all
  end

    def interview_evalution_master
      @interview_evalutions = InterviewEvalution.all
      respond_to do |f|
      f.js
      f.xls {render template: 'interview_evalutions/interview_evalution_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'interview_evalution_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'interview_evalutions/interview_evalution_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
     end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_interview_evalutions_path
      else
     InterviewEvalution.import(params[:file])
     redirect_to import_xl_interview_evalutions_path, notice: "File imported."
     end
  end
  
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_interview_evalution
      @interview_evalution = InterviewEvalution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_evalution_params
      params.require(:interview_evalution).permit(:is_confirm,:code, :name, :description)
    end
end
