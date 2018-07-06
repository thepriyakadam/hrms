class FoodOptionsController < ApplicationController
  before_action :set_food_option, only: [:show, :edit, :update, :destroy]

  # GET /food_options
  # GET /food_options.json
  def index
    @food_options = FoodOption.all
    @food_option = FoodOption.new
  end

  # GET /food_options/1
  # GET /food_options/1.json
  def show
  end

  # GET /food_options/new
  def new
    @food_option = FoodOption.new
  end

  # GET /food_options/1/edit
  def edit
  end

  # POST /food_options
  # POST /food_options.json
  def create
    @food_option = FoodOption.new(food_option_params)

      if @food_option.save
        @food_options = FoodOption.all
        @food_option = FoodOption.new
        @flag = true
      else
        @flag = false
      end
  end

  # PATCH/PUT /food_options/1
  # PATCH/PUT /food_options/1.json
  def update
      if @food_option.update(food_option_params)
        @food_options = FoodOption.all
        @food_option = FoodOption.new
        @flag = true
      else
        @flag = false
      end
  end

  # DELETE /food_options/1
  # DELETE /food_options/1.json
  def destroy
    @food_option.destroy
      @food_options = FoodOption.all
      #redirect_to food_options_path
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_option
      @food_option = FoodOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_option_params
      params.require(:food_option).permit(:travel_option_id, :code, :name, :description, :amount, :is_optional, :status)
    end
end
