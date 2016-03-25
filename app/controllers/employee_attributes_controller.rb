class EmployeeAttributesController < ApplicationController
  before_action :set_employee_attribute, only: [:show, :edit, :update, :destroy]

  # GET /employee_attributes
  # GET /employee_attributes.json
  def index
    @employee_attributes = EmployeeAttribute.all
  end

  # GET /employee_attributes/1
  # GET /employee_attributes/1.json
  def show
  end

  # GET /employee_attributes/new
  def new
    @employee_attribute = EmployeeAttribute.new
    @employee_attributes = EmployeeAttribute.all
  end

  # GET /employee_attributes/1/edit
  def edit
  end

  # POST /employee_attributes
  # POST /employee_attributes.json
  def create
    @employee_attribute = EmployeeAttribute.new(employee_attribute_params)

    respond_to do |format|
      if @employee_attribute.save
        format.html { redirect_to employee_attributes_path, notice: 'Employee attribute was successfully created.' }
        format.json { render :show, status: :created, location: @employee_attribute }
      else
        format.html { render :new }
        format.json { render json: @employee_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_attributes/1
  # PATCH/PUT /employee_attributes/1.json
  def update
    respond_to do |format|
      if @employee_attribute.update(employee_attribute_params)
        format.html { redirect_to @employee_attribute, notice: 'Employee attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_attribute }
      else
        format.html { render :edit }
        format.json { render json: @employee_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_attributes/1
  # DELETE /employee_attributes/1.json
  def destroy
    @employee_attribute.destroy
    respond_to do |format|
      format.html { redirect_to employee_attributes_url, notice: 'Employee attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appraisee
    @employee_attributes = EmployeeAttribute.all
  end

  def appraisee_create
    employee_attribute_ids = params[:employee_attribute_id]
    comments = params[:appraisee_comment]
    ratings = params[:appraisee_rating]
    final = employee_attribute_ids.zip(comments,ratings)

    final.each do |e,c,r|
      emp = EmployeeAttribute.find(e)
      emp.update(appraisee_comment: c, appraisee_rating: r, appraisee_id: params[:appraisee_id])
    end
    redirect_to appraisee_employee_attributes_path
  end

  def appraiser
    @employee_attributes = EmployeeAttribute.all
  end

  def appraiser_create
    employee_attribute_ids = params[:employee_attribute_id]
    comments = params[:appraiser_comment]
    ratings = params[:appraiser_rating]
    final = employee_attribute_ids.zip(comments,ratings)

    final.each do |e,c,r|
      emp = EmployeeAttribute.find(e)
      emp.update(appraiser_comment: c,appraiser_rating: r, appraiser_id: params[:appraiser_id])
    end
    redirect_to appraiser_employee_attributes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_attribute
      @employee_attribute = EmployeeAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_attribute_params
      params.require(:employee_attribute).permit(:performance_period_id,:appraisee_id, :appraiser_id, :attribute_master_id, :definition_id, :weightage, :appraisee_comment, :appraisee_rating, :appraiser_comment, :appraiser_rating)
    end
end
