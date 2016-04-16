class LeavCategoriesController < ApplicationController
  before_action :set_leav_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @leav_category = LeavCategory.new
    @leav_categories = LeavCategory.all
  end

  def edit
  end

  def create
    @leav_category = LeavCategory.new(leav_category_params)
    @leav_categories = LeavCategory.all
    respond_to do |format|
      if @leav_category.save
        @leav_category = LeavCategory.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Leave Type Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  def update
    @leav_category.update(leav_category_params)
    @leav_categories = LeavCategory.all
    @leav_category = LeavCategory.new
  end

  def destroy
    @leav_category.destroy
    @leav_categories = LeavCategory.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leav_category
    @leav_category = LeavCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leav_category_params
    params.require(:leav_category).permit(:code, :name, :description)
  end
end
