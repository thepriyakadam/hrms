class RetentionMoneysController < ApplicationController
  before_action :set_retention_money, only: [:show, :edit, :update, :destroy]

  # GET /retention_moneys
  # GET /retention_moneys.json
  def index
    @retention_moneys = RetentionMoney.all
  end

  # GET /retention_moneys/1
  # GET /retention_moneys/1.json
  def show
  end

  # GET /retention_moneys/new
  def new
    @retention_money = RetentionMoney.new
  end

  # GET /retention_moneys/1/edit
  def edit
  end

  # POST /retention_moneys
  # POST /retention_moneys.json
  def create
    @retention_money = RetentionMoney.new(retention_money_params)

    respond_to do |format|
      if @retention_money.save
        format.html { redirect_to @retention_money, notice: 'Retention money was successfully created.' }
        format.json { render :show, status: :created, location: @retention_money }
      else
        format.html { render :new }
        format.json { render json: @retention_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retention_moneys/1
  # PATCH/PUT /retention_moneys/1.json
  def update
    respond_to do |format|
      if @retention_money.update(retention_money_params)
        format.html { redirect_to @retention_money, notice: 'Retention money was successfully updated.' }
        format.json { render :show, status: :ok, location: @retention_money }
      else
        format.html { render :edit }
        format.json { render json: @retention_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retention_moneys/1
  # DELETE /retention_moneys/1.json
  def destroy
    @retention_money.destroy
    respond_to do |format|
      format.html { redirect_to retention_moneys_url, notice: 'Retention money was successfully destroyed.' }
      format.json { head :no_content }
    end
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
