class EmployeePromotionsController < ApplicationController
  before_action :set_employee_promotion, only: [:show, :edit, :update, :destroy]

  # GET /employee_promotions
  # GET /employee_promotions.json
  def index
    @employee_promotions = EmployeePromotion.all
    session[:active_tab] ="promotionmanagement"
  end

  # GET /employee_promotions/1
  # GET /employee_promotions/1.json
  def show
  end

  # GET /employee_promotions/new
  def new
    @employee_promotion = EmployeePromotion.new
  end

  # GET /employee_promotions/1/edit
  def edit
  end

  # POST /employee_promotions
  # POST /employee_promotions.json
  def create
    @employee_promotion = EmployeePromotion.new(employee_promotion_params)
    @employee_id = params[:employee_promotion][:employee_id]
    @department_id = params[:employee_promotion][:department_id]
    @employee_designation_id = params[:employee_promotion][:employee_designation_id]
    @employee_grade_id = params[:employee_promotion][:employee_grade_id]
    @employee_category_id = params[:employee_promotion][:employee_category_id]
    @employee = Employee.find(@employee_id)
    @employee.update(department_id: @department_id)
    @joining_detail= JoiningDetail.find_by_employee_id(@employee_id)
    @joining_detail.update(employee_designation_id: @employee_designation_id,employee_grade_id: @employee_grade_id,employee_category_id: @employee_category_id)
    respond_to do |format|
      if @employee_promotion.save
        format.html { redirect_to @employee_promotion, notice: 'Employee promotion was successfully created.' }
        format.json { render :show, status: :created, location: @employee_promotion }
      else
        format.html { render :new }
        format.json { render json: @employee_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_promotions/1
  # PATCH/PUT /employee_promotions/1.json
  def update
    respond_to do |format|
    if @employee_promotion.update(employee_promotion_params)
    @employee_id = params[:employee_promotion][:employee_id]
    @department_id = params[:employee_promotion][:department_id]
    @employee_designation_id = params[:employee_promotion][:employee_designation_id]
    @employee_grade_id = params[:employee_promotion][:employee_grade_id]
    @employee_category_id = params[:employee_promotion][:employee_category_id]
    @employee = Employee.find(@employee_id)
    @employee.update(department_id: @department_id)
    @joining_detail= JoiningDetail.find_by_employee_id(@employee_id)
    @joining_detail.update(employee_designation_id: @employee_designation_id,employee_grade_id: @employee_grade_id,employee_category_id: @employee_category_id)
        format.html { redirect_to @employee_promotion, notice: 'Employee promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_promotion }
      else
        format.html { render :edit }
        format.json { render json: @employee_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_promotions/1
  # DELETE /employee_promotions/1.json
  def destroy
    @employee_promotion.destroy
    respond_to do |format|
      format.html { redirect_to employee_promotions_url, notice: 'Employee promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect_data
    @employee = Employee.find(params[:employee_id])
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
  end

  def print_employee_promotion
      @employee = Employee.find(params[:id])
      @employee_promotions = EmployeePromotion.where(employee_id: params[:id])
            respond_to do |f|
            f.js
            f.html
            f.pdf do
              render pdf: 'print_employee_promotion',
              layout: 'pdf.html',
              template: 'employee_promotions/print_employee_promotion.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:13,bottom:13,left:13,right:13 }
            end
          end
     end


  def promotion_history
    @employee = Employee.find(params[:id])
    @employee_promotions = EmployeePromotion.where(employee_id: params[:id])
  end

  def employee_list
      @employees = Employee.all
  end

  def print_promotion_excel
    # byebug
    @employee = Employee.find(params[:id])
    @employee_promotions = EmployeePromotion.where(employee_id: params[:id])
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_promotions/print_promotion_excel.xls.erb'}
      f.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_promotion
      @employee_promotion = EmployeePromotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_promotion_params
      params.require(:employee_promotion).permit(:employee_id, :department_id, :employee_designation_id, :employee_grade_id, :employee_category_id, :employee_ctc, :justification, :effective_from, :effective_to)
    end
end
