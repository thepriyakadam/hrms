class EmployeeDocumentsController < ApplicationController
  before_action :set_employee_document, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

  # GET /employee_documents
  # GET /employee_documents.json
  def index
    @employee_documents = EmployeeDocument.all
  end

  # GET /employee_documents/1
  # GET /employee_documents/1.json

  
  def show
    @employee = @employee_document.employee
  end

  # GET /employee_documents/new
  def new
    @employee_document = EmployeeDocument.new
    # @employee_documents = EmployeeDocument.all
    # @employee = Employee.find(params[:id])
    session[:active_tab] = "company"
  end

  # GET /employee_documents/1/edit
  def edit
    @info = 'employee_document'
    @employee = @employee_document.employee
  end

  # POST /employee_documents
  # POST /employee_documents.json
   
  def create
     @employee_document = EmployeeDocument.new(employee_document_params)
     #@employee_documents = EmployeeDocument.all
     @employee = Employee.find(params[:employee_document][:employee_id])
     ActiveRecord::Base.transaction do
     respond_to do |format|
      if @employee_document.save
        @employee_documents = EmployeeDocument.where(employee_id: @employee.id)
        EmployeeMailer.employee_document_create(@employee,@employee_document).deliver_now
        format.html { redirect_to @employee_document, notice: 'Employee Document saved Successfully.' }
        format.json { render :show, status: :created, location: @employee_document }
        format.js { @flag = true }
      else
        format.html { render :new }
        format.json { render json: @employee_document.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
  end

    end
  end
  # PATCH/PUT /employee_documents/1
  # PATCH/PUT /employee_documents/1.json
  def update
    @employee = Employee.find(params['employee_document']['employee_id'])
    respond_to do |format|
      if @employee_document.update(employee_document_params)
        # format.html { redirect_to @employee_document, notice: 'Employee Document Updated Successfully.' }
        # format.json { render :show, status: :ok, location: @employee_document }
        @employee_documents = @employee.employee_documents
        EmployeeMailer.employee_document_create(@employee,@employee_document).deliver_now
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @employee_document.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
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


  def download_pic
    @employee_document = EmployeeDocument.find(params[:id])
    send_file @employee_document.image.path,
              filename: @employee_document.image_file_name,
              type: @employee_document.image_content_type,
              disposition: 'attachment'
  end

  def modal
    @employee_document = EmployeeDocument.find(params[:format])
    
  end

  def update_document
    @employee_document = EmployeeDocument.find(params[:id])
    @employee = Employee.find(@employee_document.employee_id)
    if @employee_document.update(employee_document_params)
      @employee_documents = EmployeeDocument.where(employee_id: @employee.id)
      @flag = true
    else
      @employee_documents = EmployeeDocument.where(employee_id: @employee.id)
      @flag = false  
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_document
      @employee_document = EmployeeDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_document_params
      params.require(:employee_document).permit(:employee_id, :name, :status , :document , :image)
    end

  end