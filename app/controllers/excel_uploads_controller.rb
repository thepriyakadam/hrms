class ExcelUploadsController < ApplicationController
  before_action :set_excel_upload, only: [:show, :edit, :update, :destroy]

  # GET /excel_uploads
  # GET /excel_uploads.json
  def index
    @excel_uploads = ExcelUpload.all
  end

  # GET /excel_uploads/1
  # GET /excel_uploads/1.json
  def show
  end

  # GET /excel_uploads/new
  def new
    @excel_upload = ExcelUpload.new
  end

  # GET /excel_uploads/1/edit
  def edit
  end

  # POST /excel_uploads
  # POST /excel_uploads.json
  def create
    @excel_upload = ExcelUpload.new(excel_upload_params)

    respond_to do |format|
      if @excel_upload.save
        format.html { redirect_to @excel_upload, notice: 'Excel upload was successfully created.' }
        format.json { render :show, status: :created, location: @excel_upload }
      else
        format.html { render :new }
        format.json { render json: @excel_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excel_uploads/1
  # PATCH/PUT /excel_uploads/1.json
  def update
    respond_to do |format|
      if @excel_upload.update(excel_upload_params)
        format.html { redirect_to @excel_upload, notice: 'Excel upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @excel_upload }
      else
        format.html { render :edit }
        format.json { render json: @excel_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excel_uploads/1
  # DELETE /excel_uploads/1.json
  def destroy
    @excel_upload.destroy
    respond_to do |format|
      format.html { redirect_to excel_uploads_url, notice: 'Excel upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def load_excel
    ex = Roo::Spreadsheet.open(params['upload']['spreadsheet'].open)

    ex.default_sheet = ex.sheets[1]
    3.upto(50) do |line|
      puts a = ex.cell(line, 'A')
      puts b = ex.cell(line, 'B')
      puts c = ex.cell(line, 'C')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_excel_upload
    @excel_upload = ExcelUpload.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def excel_upload_params
    params.require(:excel_upload).permit(:code, :file_name, :size)
  end
end

   
