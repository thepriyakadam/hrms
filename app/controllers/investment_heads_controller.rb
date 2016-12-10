class InvestmentHeadsController < ApplicationController
  before_action :set_investment_head, only: [:show, :edit, :update, :destroy]

  # GET /investment_heads
  # GET /investment_heads.json
  def index
     @investment_head = InvestmentHead.new
    @investment_heads = InvestmentHead.all
  end

  # GET /investment_heads/1
  # GET /investment_heads/1.json
  def show
  end

  # GET /investment_heads/new
  def new
    @investment_head = InvestmentHead.new
    @investment_heads = InvestmentHead.all
     session[:active_tab] ="PayrollManagement"
   session[:active_tab1] = "IncomeTax"
  end

  # GET /investment_heads/1/edit
  def edit
  end

  # POST /investment_heads
  # POST /investment_heads.json
  def create
    @investment_head = InvestmentHead.new(investment_head_params)
    @investment_heads = InvestmentHead.all
    respond_to do |format|
      if @investment_head.save
         @investment_head = InvestmentHead.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Investment Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /investment_heads/1
  # PATCH/PUT /investment_heads/1.json
  def update
    @investment_head.update(investment_head_params)
    @investment_head = InvestmentHead.new
    @investment_heads = InvestmentHead.all
      
  end

  # DELETE /investment_heads/1
  # DELETE /investment_heads/1.json
  def destroy
    @investment_head.destroy
     @investment_head = InvestmentHead.new
    @investment_heads = InvestmentHead.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_head
      @investment_head = InvestmentHead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_head_params
      params.require(:investment_head).permit(:section_id, :description, :limit)
    end
end
