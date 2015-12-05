class LeavCategoriesController < ApplicationController
  before_action :set_leav_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /leav_categories
  # GET /leav_categories.json
  def index
    @leav_categories = LeavCategory.all
  end

  # GET /leav_categories/1
  # GET /leav_categories/1.json
  def show
  end

  # GET /leav_categories/new
  def new
    @leav_category = LeavCategory.new
  end

  # GET /leav_categories/1/edit
  def edit
  end

  # POST /leav_categories
  # POST /leav_categories.json
  def create
    @leav_category = LeavCategory.new(leav_category_params)

    respond_to do |format|
      if @leav_category.save
        format.html { redirect_to @leav_category, notice: 'Leav category was successfully created.' }
        format.json { render :show, status: :created, location: @leav_category }
      else
        format.html { render :new }
        format.json { render json: @leav_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leav_categories/1
  # PATCH/PUT /leav_categories/1.json
  def update
    respond_to do |format|
      if @leav_category.update(leav_category_params)
        format.html { redirect_to @leav_category, notice: 'Leav category was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_category }
      else
        format.html { render :edit }
        format.json { render json: @leav_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_categories/1
  # DELETE /leav_categories/1.json
  def destroy
    @leav_category.destroy
    respond_to do |format|
      format.html { redirect_to leav_categories_url, notice: 'Leav category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_category
      @leav_category = LeavCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_category_params
      params.require(:leav_category).permit(:name)
    end
end
