class ReservedCategoriesController < ApplicationController
  before_action :set_reserved_category, only: [:show, :edit, :update, :destroy]

  # GET /reserved_categories/new
  def new
    @reserved_category = ReservedCategory.new
    @reserved_categories = ReservedCategory.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /reserved_categories/1/edit
  def edit
  end

  # POST /reserved_categories
  # POST /reserved_categories.json
  def create
    @reserved_category = ReservedCategory.new(reserved_category_params)
    @reserved_categories = ReservedCategory.all
    respond_to do |format|
      if @reserved_category.save
        @reserved_category = ReservedCategory.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reserved Category Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reserved_categories/1
  # PATCH/PUT /reserved_categories/1.json
  def update
    @reserved_category.update(reserved_category_params)
    @reserved_categories = ReservedCategory.all
    @reserved_category = ReservedCategory.new
  end

  # DELETE /reserved_categories/1
  # DELETE /reserved_categories/1.json
  def destroy
    @reserved_category.destroy
    @reserved_categories = ReservedCategory.all
  end

  def reserved_category_master
     @reserved_categories = ReservedCategory.all
     respond_to do |f|
      f.js
      f.xls {render template: 'reserved_categories/reserved_category_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' reserved_category_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'reserved_categories/reserved_category_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reserved_category
    @reserved_category = ReservedCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reserved_category_params
    params.require(:reserved_category).permit(:is_confirm,:code, :name, :description)
  end
end
