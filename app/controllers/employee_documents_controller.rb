class EmployeeDocumentsController < ApplicationController
  before_action :set_employee_document, only: [:show, :edit, :update, :destroy]

  # GET /employee_documents
  # GET /employee_documents.json
  def index
    @employee_documents = EmployeeDocument.all
  end

  # GET /employee_documents/1
  # GET /employee_documents/1.json
  def show
  end

  # GET /employee_documents/new
  def new
    @employee_document = EmployeeDocument.new
    @employee_documents = EmployeeDocument.all
    session[:active_tab] = "company"
  end

  # GET /employee_documents/1/edit
  def edit
  end

  # POST /employee_documents
  # POST /employee_documents.json
   
  def create
     @employee_document = EmployeeDocument.new(employee_document_params)
     @employee_documents = EmployeeDocument.all
      if @employee_document.save
        @employee_document = EmployeeDocument.new
      end
      flash[:notice] = 'Employee Document saved Successfully.' 
      redirect_to new_employee_document_path
        
  end
  # PATCH/PUT /employee_documents/1
  # PATCH/PUT /employee_documents/1.json
  def update
   @employee_document.update(employee_document_params)
   @employee_documents = EmployeeDocument.all
   @employee_document = EmployeeDocument.new
   redirect_to new_employee_document_path
  end

  # DELETE /employee_documents/1
  # DELETE /employee_documents/1.json
  def destroy
    @employee_document.destroy
    @employee_documents = EmployeeDocument.all
  end

   def download_emp
    @employee_document = EmployeeDocument.find(params[:id])
    send_file @employee_document.document.path,
              filename: @employee_document.document,
              type: @employee_document.document_content_type,
              disposition: 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_document
      @employee_document = EmployeeDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_document_params
      params.require(:employee_document).permit(:employee_id, :name, :status , :document)
    end

  end