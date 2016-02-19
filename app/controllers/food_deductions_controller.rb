class FoodDeductionsController < ApplicationController
  before_action :set_food_deduction, only: [:show, :edit, :update, :destroy]

  # GET /food_deductions
  # GET /food_deductions.json
  def index
    @food_deductions = FoodDeduction.all
  end

  # GET /food_deductions/1
  # GET /food_deductions/1.json
  def show
  end

  # GET /food_deductions/new
  def new
    @food_deduction = FoodDeduction.new
  end

  # GET /food_deductions/1/edit
  def edit
  end

  # POST /food_deductions
  # POST /food_deductions.json
  def create
    @food_deduction = FoodDeduction.new(food_deduction_params)

    respond_to do |format|
      if @food_deduction.save
        format.html { redirect_to @food_deduction, notice: 'Food deduction was successfully created.' }
        format.json { render :show, status: :created, location: @food_deduction }
      else
        format.html { render :new }
        format.json { render json: @food_deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_deductions/1
  # PATCH/PUT /food_deductions/1.json
  def update
    respond_to do |format|
      if @food_deduction.update(food_deduction_params)
        format.html { redirect_to @food_deduction, notice: 'Food deduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_deduction }
      else
        format.html { render :edit }
        format.json { render json: @food_deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_deductions/1
  # DELETE /food_deductions/1.json
  def destroy
    @food_deduction.destroy
    respond_to do |format|
      format.html { redirect_to food_deductions_url, notice: 'Food deduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_food_deduction_amount
    total_coupan = params[:total_coupan].to_i
    food_coupan = FoodCoupanMaster.find(params[:id])
    price = food_coupan.price.to_i
    @amount = price * total_coupan
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_deduction
      @food_deduction = FoodDeduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_deduction_params
      params.require(:food_deduction).permit(:food_date, :no_of_coupan, :amount, :employee_id, :return_coupan, :total_coupan, :food_coupan_master_id)
    end
end
