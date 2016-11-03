class RetentionMoneysController < ApplicationController
  before_action :set_retention_money, only: [:show, :edit, :update, :destroy]

  # GET /retention_moneys
  # GET /retention_moneys.json
  def index
  end

  # GET /retention_moneys/1
  # GET /retention_moneys/1.json
  def show
  end

  # GET /retention_moneys/new
  def new
    @retention_money = RetentionMoney.new
    @retention_moneys = RetentionMoney.all
    session[:active_tab] ="master"
    session[:active_tab1] ="payrollcomponents"
  end

  # GET /retention_moneys/1/edit
  def edit
  end


  def create
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end

    @retention_money = RetentionMoney.new(retention_money_params)
    @retention_money.base_component = str
    @retention_moneys = RetentionMoney.all
    @retention_money.save
    #@retention_money = RetentionMoney.new

    redirect_to new_retention_money_path
    flash[:notice] = "Saved Successfully"
  end

  # PATCH/PUT /retention_moneys/1
  # PATCH/PUT /retention_moneys/1.json
  def update
    @retention_money.update(retention_money_params)
    @retention_moneys = RetentionMoney.all
    @retention_money = RetentionMoney.new
  end

  # DELETE /retention_moneys/1
  # DELETE /retention_moneys/1.json
  def destroy
    @retention_money.destroy
    @retention_moneys = RetentionMoney.all
  end

  def is_confirm
    @retention_money = RetentionMoney.find(params[:retention_money])
    RetentionMoney.find(@retention_money.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_retention_money_path
  end

  def select_form
    # byebug
    @retention_money = RetentionMoney.new
    if params[:have_retention] == "true"
      @flag = true
    else
      @flag = false
    end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retention_money
    @retention_money = RetentionMoney.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def retention_money_params
    params.require(:retention_money).permit(:is_persent,:persent,:base_component,:max_limit,:is_active,:is_confirm,:have_retention, :amount, :no_of_month, :description)
  end
end
