class EmployeeCategoriesController < ApplicationController
  before_action :set_employee_category, only: [:show, :edit, :update, :destroy]


def index
   
end

  def new
    @employee_category = EmployeeCategory.new
    @employee_categories = EmployeeCategory.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="OnBording"
  end

  # GET /employee_categories/1/edit
  def edit
    
  end

  # POST /employee_categories
  # POST /employee_categories.json

    
  def create
    @employee_category = EmployeeCategory.new(employee_category_params)
    @employee_categories = EmployeeCategory.all
      respond_to do |format|
    if @employee_category.save
       @employee_category = EmployeeCategory.new
      format.js { @flag = true }
      else
        flash.now[:alert] = 'Leave Category Already Exist.'
        format.js { @flag = false }
      end
    end
    # @employee_categories = EmployeeCategory.all
    # redirect_to new_employee_category_path
  end


  # PATCH/PUT /employee_categories/1
  # PATCH/PUT /employee_categories/1.json
  def update
    @employee_category.update(employee_category_params)
    @employee_categories = EmployeeCategory.all
    @employee_category = EmployeeCategory.new
    # redirect_to new_employee_category_path
  end

  # DELETE /employee_categories/1
  # DELETE /employee_categories/1.json
  def destroy
    @employee_category.destroy
    @employee_categories = EmployeeCategory.all
  end

    def employee_category_master
     @employee_categories = EmployeeCategory.all
     respond_to do |f|
      f.js
      f.xls {render template: 'employee_categories/employee_category_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' employee_category_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_categories/employee_category_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_employee_categories_path
      else
     EmployeeCategory.import(params[:file])
     redirect_to new_employee_category_path, notice: "File imported."
     end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_category
    @employee_category = EmployeeCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_category_params
    params.require(:employee_category).permit(:is_confirm,:code, :name, :description,:is_active)
  end
end
