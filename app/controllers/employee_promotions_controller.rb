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
