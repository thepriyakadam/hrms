class AttributeRatingSheetsController < ApplicationController
  before_action :set_attribute_rating_sheet, only: [:show, :edit, :update, :destroy]

  # GET /attribute_rating_sheets
  # GET /attribute_rating_sheets.json
  def index
    @attribute_rating_sheets = AttributeRatingSheet.all
  end

  # GET /attribute_rating_sheets/1
  # GET /attribute_rating_sheets/1.json
  def show
  end

  # GET /attribute_rating_sheets/new
  def new
    @attribute_rating_sheet = AttributeRatingSheet.new
    @employee_attributes = []
    @attribute_rating_sheets = AttributeRatingSheet.all
    if @attribute_rating_sheets.nil?
      @attribute_rating_sheets.each do |a|
        temp = AttributeRatingSheet.exists?(appraisee_id: current_user.employee_id, employee_attribute_id: a.employee_attribute_id)
        if temp
              
        else
          ea = EmployeeAttribute.find(a.employee_attribute_id)
          @employee_attributes << ea
        end
      end
    else
      @employee_attributes = EmployeeAttribute.all
    end
    
  end

  # GET /attribute_rating_sheets/1/edit
  def edit
    @employee_attributes = EmployeeAttribute.all
  end

  # POST /attribute_rating_sheets
  # POST /attribute_rating_sheets.json
  def create
    attribute_rating_sheet_ids = params[:employee_attribute_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
    final = attribute_rating_sheet_ids.zip(comments,ratings)

    final.each do |e,c,r|
      emp = EmployeeAttribute.find(e)
      AttributeRatingSheet.create(appraisee_comment: c, appraisee_rating: r, appraisee_id: params[:appraisee_id], employee_attribute_id: emp.id)
    end
    flash[:notice] = "Employee Attribute Created Successfully"
    redirect_to attribute_rating_sheets_path
  end

  # PATCH/PUT /attribute_rating_sheets/1
  # PATCH/PUT /attribute_rating_sheets/1.json
  def update
    respond_to do |format|
      if @attribute_rating_sheet.update(attribute_rating_sheet_params)
        format.html { redirect_to @attribute_rating_sheet, notice: 'Attribute rating sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @attribute_rating_sheet }
      else
        format.html { render :edit }
        format.json { render json: @attribute_rating_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_rating_sheets/1
  # DELETE /attribute_rating_sheets/1.json
  def destroy
    @attribute_rating_sheet.destroy
    respond_to do |format|
      format.html { redirect_to attribute_rating_sheets_url, notice: 'Attribute rating sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appraiser
    @attribute_rating_sheets = AttributeRatingSheet.all
    @attribute_rating_sheet = AttributeRatingSheet.new
  end

  def appraiser_create
    attribute_rating_sheets = params[:attribute_rating_sheet_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating]
    final = attribute_rating_sheets.zip(comments,ratings)
    final.each do |e,c,r|
      attribute_rating_sheet = AttributeRatingSheet.find(e)
      attribute_rating_sheet.update(appraiser_comment: c, appraiser_rating: r, appraiser_id: params[:appraiser_id])
    end
    flash[:notice] = "Appraiser Attribute Created Successfully"
    redirect_to appraiser_attribute_rating_sheets_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_rating_sheet
      @attribute_rating_sheet = AttributeRatingSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_rating_sheet_params
      params.require(:attribute_rating_sheet).permit(:appraisee_id, :appraiser_id, :employee_attribute_id, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
