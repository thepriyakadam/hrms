class ReservedCategoriesController < ApplicationController
  before_action :set_reserved_category, only: [:show, :edit, :update, :destroy]

  # GET /reserved_categories
  # GET /reserved_categories.json
  def index
    @reserved_categories = ReservedCategory.all
  end

  # GET /reserved_categories/1
  # GET /reserved_categories/1.json
  def show
  end

  # GET /reserved_categories/new
  def new
    @reserved_category = ReservedCategory.new
  end

  # GET /reserved_categories/1/edit
  def edit
  end

  # POST /reserved_categories
  # POST /reserved_categories.json
  def create
    @reserved_category = ReservedCategory.new(reserved_category_params)

    respond_to do |format|
      if @reserved_category.save
        format.html { redirect_to @reserved_category, notice: 'Reserved category was successfully created.' }
        format.json { render :show, status: :created, location: @reserved_category }
      else
        format.html { render :new }
        format.json { render json: @reserved_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserved_categories/1
  # PATCH/PUT /reserved_categories/1.json
  def update
    respond_to do |format|
      if @reserved_category.update(reserved_category_params)
        format.html { redirect_to @reserved_category, notice: 'Reserved category was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserved_category }
      else
        format.html { render :edit }
        format.json { render json: @reserved_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserved_categories/1
  # DELETE /reserved_categories/1.json
  def destroy
    @reserved_category.destroy
    respond_to do |format|
      format.html { redirect_to reserved_categories_url, notice: 'Reserved category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserved_category
      @reserved_category = ReservedCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserved_category_params
      params.require(:reserved_category).permit(:code, :name, :description)
    end
end
