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

  # POST /retention_moneys
  # POST /retention_moneys.json
  def create
    @retention_money = RetentionMoney.new(retention_money_params)
    @retention_moneys = RetentionMoney.all
    respond_to do |format|
      if @retention_money.save
        @retention_money = RetentionMoney.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Retention Money Already Exist.'
        format.js { @flag = false }
      end
    end
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retention_money
    @retention_money = RetentionMoney.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def retention_money_params
    params.require(:retention_money).permit(:have_retention, :amount, :no_of_month, :description)
  end
end
