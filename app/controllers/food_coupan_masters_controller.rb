class FoodCoupanMastersController < ApplicationController
  before_action :set_food_coupan_master, only: [:show, :edit, :update, :destroy]

  def new
    @food_coupan_master = FoodCoupanMaster.new
    @food_coupan_masters = FoodCoupanMaster.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="PayrollComponent"
  end

  # GET /food_coupan_masters/1/edit
  def edit
  end

  # POST /food_coupan_masters
  # POST /food_coupan_masters.json
  def create
    @food_coupan_master = FoodCoupanMaster.new(food_coupan_master_params)
    @food_coupan_masters = FoodCoupanMaster.all
    respond_to do |format|
      if @food_coupan_master.save
        @food_coupan_master = FoodCoupanMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Employee Type Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /food_coupan_masters/1
  # PATCH/PUT /food_coupan_masters/1.json
  def update
    @food_coupan_master.update(food_coupan_master_params)
    @food_coupan_masters = FoodCoupanMaster.all
    @food_coupan_master = FoodCoupanMaster.new
  end

  # DELETE /food_coupan_masters/1
  # DELETE /food_coupan_masters/1.json
  def destroy
    @food_coupan_master.destroy
    @food_coupan_masters = FoodCoupanMaster.all
  end

  def food_coupan_master
     @food_coupan_masters = FoodCoupanMaster.all
     respond_to do |f|
      f.js
      f.xls {render template: 'food_coupan_masters/food_coupan_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' food_coupan_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'food_coupan_masters/food_coupan_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_coupan_master
    @food_coupan_master = FoodCoupanMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_coupan_master_params
    params.require(:food_coupan_master).permit(:is_confirm,:code, :name, :description, :price)
  end
end
