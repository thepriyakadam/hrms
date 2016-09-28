class DueTemplatesController < ApplicationController
  before_action :set_due_template, only: [:show, :edit, :update, :destroy]

  # GET /due_templates
  # GET /due_templates.json
  def index
    @due_templates = DueTemplate.all
  end

  # GET /due_templates/1
  # GET /due_templates/1.json
  def show
  end

  # GET /due_templates/new
  def new
    @due_template = DueTemplate.new
    @due_templates = DueTemplate.all
    session[:active_tab] = "resignationmanagement"
    session[:active_tab1] ="no_due_mgmt"
  end

  # GET /due_templates/1/edit
  def edit
  end

  # POST /due_templates
  # POST /due_templates.json
  
  def create
     @due_template = DueTemplate.new(due_template_params)
     @due_templates = DueTemplate.all
      if @due_template.save
        @due_template = DueTemplate.new
      end
      redirect_to new_due_template_path
      flash[:notice] = 'Due Template created Successfully.'   
  end

  # PATCH/PUT /due_templates/1
  # PATCH/PUT /due_templates/1.json

  def update
    @due_template.update(due_template_params)
    @due_templates = DueTemplate.all
    @due_template = DueTemplate.new
    redirect_to new_due_template_path
    flash[:notice] = 'Due Template updated Successfully.'   
  end

  # DELETE /due_templates/1
  # DELETE /due_templates/1.json

  def destroy
    @due_template.destroy
    @due_templates = DueTemplate.all
  end

  def download_due_tempalte_documents
    @due_template = DueTemplate.find(params[:id])
    send_file @due_template.document.path,
              filename: @due_template.document_file_name,
              type: @due_template.document_content_type,
              disposition: 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_template
      @due_template = DueTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_template_params
      params.require(:due_template).permit(:code, :name, :status, :document)
    end
end
