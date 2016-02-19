class FoodCoupanMastersController < ApplicationController
  before_action :set_food_coupan_master, only: [:show, :edit, :update, :destroy]

  # GET /food_coupan_masters
  # GET /food_coupan_masters.json
  def index
    @food_coupan_masters = FoodCoupanMaster.all
  end

  # GET /food_coupan_masters/1
  # GET /food_coupan_masters/1.json
  def show
  end

  # GET /food_coupan_masters/new
  def new
    @food_coupan_master = FoodCoupanMaster.new
  end

  # GET /food_coupan_masters/1/edit
  def edit
  end

  # POST /food_coupan_masters
  # POST /food_coupan_masters.json
  def create
    @food_coupan_master = FoodCoupanMaster.new(food_coupan_master_params)

    respond_to do |format|
      if @food_coupan_master.save
        format.html { redirect_to @food_coupan_master, notice: 'Food coupan master was successfully created.' }
        format.json { render :show, status: :created, location: @food_coupan_master }
      else
        format.html { render :new }
        format.json { render json: @food_coupan_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_coupan_masters/1
  # PATCH/PUT /food_coupan_masters/1.json
  def update
    respond_to do |format|
      if @food_coupan_master.update(food_coupan_master_params)
        format.html { redirect_to @food_coupan_master, notice: 'Food coupan master was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_coupan_master }
      else
        format.html { render :edit }
        format.json { render json: @food_coupan_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_coupan_masters/1
  # DELETE /food_coupan_masters/1.json
  def destroy
    @food_coupan_master.destroy
    respond_to do |format|
      format.html { redirect_to food_coupan_masters_url, notice: 'Food coupan master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_coupan_master
      @food_coupan_master = FoodCoupanMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_coupan_master_params
      params.require(:food_coupan_master).permit(:code, :name, :description, :price)
    end
end
