class InterviewAttributesController < ApplicationController
  before_action :set_interview_attribute, only: [:show, :edit, :update, :destroy]

  # GET /interview_attributes
  # GET /interview_attributes.json
  def index
    @interview_attributes = InterviewAttribute.all
  end

  # GET /interview_attributes/1
  # GET /interview_attributes/1.json
  def show
  end

  # GET /interview_attributes/new
  def new
    @interview_attribute = InterviewAttribute.new
    @interview_attributes = InterviewAttribute.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Recruitment"
  end

  # GET /interview_attributes/1/edit
  def edit
  end

  # POST /interview_attributes
  # POST /interview_attributes.json
  def create
   @interview_attribute = InterviewAttribute.new(interview_attribute_params)
    @interview_attributes = InterviewAttribute.all
    respond_to do |format|
      if @interview_attribute.save
         @interview_attribute = InterviewAttribute.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Interview Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /interview_attributes/1
  # PATCH/PUT /interview_attributes/1.json
  def update
   @interview_attribute.update(interview_attribute_params)
    @interview_attributes = InterviewAttribute.all
    @interview_attribute = InterviewAttribute.new
  end

  # DELETE /interview_attributes/1
  # DELETE /interview_attributes/1.json
  def destroy
   @interview_attribute.destroy
    @interview_attributes = InterviewAttribute.all
  end

  def interview_attribute_master
      @interview_attributes = InterviewAttribute.all
      respond_to do |f|
      f.js
      f.xls {render template: 'interview_attributes/interview_attribute_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'interview_attribute_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'interview_attributes/interview_attribute_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

    def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_interview_attributes_path
      else
     InterviewAttribute.import(params[:file])
     redirect_to new_interview_attribute_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_attribute
      @interview_attribute = InterviewAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_attribute_params
      params.require(:interview_attribute).permit(:is_confirm,:code, :name, :description)
    end
end
