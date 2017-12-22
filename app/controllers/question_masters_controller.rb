class QuestionMastersController < ApplicationController
  before_action :set_question_master, only: [:show, :edit, :update, :destroy]

  # GET /question_masters
  # GET /question_masters.json
  def index
    @question_masters = QuestionMaster.all
  end

  # GET /question_masters/1
  # GET /question_masters/1.json
  def show
  end

  # GET /question_masters/new
  def new
    @question_master = QuestionMaster.new
    @question_masters = QuestionMaster.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Resignation"
  end

  # GET /question_masters/1/edit
  def edit
  end

  # POST /question_masters
  # POST /question_masters.json
  def create
     @question_master = QuestionMaster.new(question_master_params)
    @question_masters = QuestionMaster.all
    respond_to do |format|
      if @question_master.save
         @question_master = QuestionMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Question Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /question_masters/1
  # PATCH/PUT /question_masters/1.json
  def update
    @question_master.update(question_master_params)
   @question_master = QuestionMaster.new
   @question_masters = QuestionMaster.all
  end

  # DELETE /question_masters/1
  # DELETE /question_masters/1.json
  def destroy
    @question_master.destroy
    @question_masters = QuestionMaster.all
  end

   def question_master
      @question_masters = QuestionMaster.all
      respond_to do |f|
      f.js
      f.xls {render template: 'question_masters/question_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'question_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'question_masters/question_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
     end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_question_masters_path
      else
     QuestionMaster.import(params[:file])
     redirect_to import_xl_question_masters_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_master
      @question_master = QuestionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_master_params
      params.require(:question_master).permit(:is_confirm,:code, :name, :description)
    end
end
