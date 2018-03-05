class InterviewTypesController < ApplicationController
  before_action :set_interview_type, only: [:show, :edit, :update, :destroy]

  # GET /interview_types
  # GET /interview_types.json
  def index
    @interview_types = InterviewType.all
  end

  # GET /interview_types/1
  # GET /interview_types/1.json
  def show
  end

  # GET /interview_types/new
  def new
    @interview_type = InterviewType.new
    @interview_types = InterviewType.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Recruitment"
  end

  # GET /interview_types/1/edit
  def edit
  end

  # POST /interview_types
  # POST /interview_types.json

  def create
    @interview_type = InterviewType.new(interview_type_params)
    @interview_types = InterviewType.all
    respond_to do |format|
      if @interview_type.save
         @interview_type = InterviewType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Type Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_types/1
  # PATCH/PUT /interview_types/1.json
  def update
    @interview_type.update(interview_type_params)
    @interview_types = InterviewType.all
    @interview_type = InterviewType.new
  end

  # DELETE /interview_types/1
  # DELETE /interview_types/1.json

  def destroy
    @interview_type.destroy
    @interview_types = InterviewType.all
  end

   def interview_type_master
      @interview_types = InterviewType.all
      respond_to do |f|
      f.js
      f.xls {render template: 'interview_types/interview_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'interview_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'interview_types/interview_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end


    def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_interview_types_path
      else
     InterviewType.import(params[:file])
     redirect_to new_interview_type_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_type
      @interview_type = InterviewType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_type_params
      params.require(:interview_type).permit(:is_confirm,:code, :name, :description)
    end
end
