class InvestmentHeadsController < ApplicationController
  before_action :set_investment_head, only: [:show, :edit, :update, :destroy]

  # GET /investment_heads
  # GET /investment_heads.json
  def index
    @investment_heads = InvestmentHead.all
  end

  # GET /investment_heads/1
  # GET /investment_heads/1.json
  def show
  end

  # GET /investment_heads/new
  def new
    @investment_head = InvestmentHead.new
  end

  # GET /investment_heads/1/edit
  def edit
  end

  # POST /investment_heads
  # POST /investment_heads.json
  def create
    @investment_head = InvestmentHead.new(investment_head_params)

    respond_to do |format|
      if @investment_head.save
        format.html { redirect_to @investment_head, notice: 'Investment head was successfully created.' }
        format.json { render :show, status: :created, location: @investment_head }
      else
        format.html { render :new }
        format.json { render json: @investment_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investment_heads/1
  # PATCH/PUT /investment_heads/1.json
  def update
    respond_to do |format|
      if @investment_head.update(investment_head_params)
        format.html { redirect_to @investment_head, notice: 'Investment head was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment_head }
      else
        format.html { render :edit }
        format.json { render json: @investment_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_heads/1
  # DELETE /investment_heads/1.json
  def destroy
    @investment_head.destroy
    respond_to do |format|
      format.html { redirect_to investment_heads_url, notice: 'Investment head was successfully destroyed.' }
      format.json { head :no_content }
    end
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
