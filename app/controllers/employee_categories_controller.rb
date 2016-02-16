class EmployeeCategoriesController < ApplicationController
  before_action :set_employee_category, only: [:show, :edit, :update, :destroy]

  def new
    @employee_category = EmployeeCategory.new
    @employee_categories = EmployeeCategory.all
  end

  # GET /employee_categories/1/edit
  def edit
  end

  # POST /employee_categories
  # POST /employee_categories.json
  def create
    @employee_category = EmployeeCategory.new(employee_category_params)
    @employee_category.save
    @employee_categories = EmployeeCategory.all
    @employee_category = EmployeeCategory.new
  end

  # PATCH/PUT /employee_categories/1
  # PATCH/PUT /employee_categories/1.json
  def update
     @employee_category.update(employee_category_params)
     @employee_categories = EmployeeCategory.all
     @employee_category = EmployeeCategory.new  
  end

  # DELETE /employee_categories/1
  # DELETE /employee_categories/1.json
  def destroy
    @employee_category.destroy
    @employee_categories = EmployeeCategory.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_category
      @employee_category = EmployeeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_category_params
      params.require(:employee_category).permit(:code, :name, :description)
    end
end