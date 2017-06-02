class ReimbursementHeadsController < ApplicationController
  before_action :set_reimbursement_head, only: [:show, :edit, :update, :destroy]

  # GET /reimbursement_heads
  # GET /reimbursement_heads.json
  def index
    @reimbursement_heads = ReimbursementHead.all
  end

  # GET /reimbursement_heads/1
  # GET /reimbursement_heads/1.json
  def show
  end

  # GET /reimbursement_heads/new
  def new
    @reimbursement_head = ReimbursementHead.new
    @reimbursement_heads = ReimbursementHead.all
    session[:active_tab] ="ltareimbursement"
  end

  # GET /reimbursement_heads/1/edit
  def edit
  end

  # POST /reimbursement_heads
  # POST /reimbursement_heads.json
  def create
    @reimbursement_head = ReimbursementHead.new(reimbursement_head_params)
    @reimbursement_heads = ReimbursementHead.all

    respond_to do |format|
      if @reimbursement_head.save
    @reimbursement_head = ReimbursementHead.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reimbursement Head was Successfully created.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reimbursement_heads/1
  # PATCH/PUT /reimbursement_heads/1.json
  def update
    @reimbursement_head.update(reimbursement_head_params)
    @reimbursement_head = ReimbursementHead.new
    @reimbursement_heads = ReimbursementHead.all
  end

  # DELETE /reimbursement_heads/1
  # DELETE /reimbursement_heads/1.json
  def destroy
    @reimbursement_head.destroy
    @reimbursement_heads = ReimbursementHead.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement_head
      @reimbursement_head = ReimbursementHead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reimbursement_head_params
      params.require(:reimbursement_head).permit(:code, :name, :description, :status)
    end
end
