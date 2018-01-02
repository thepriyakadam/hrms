class PolicyDetailsController < ApplicationController
  before_action :set_policy_detail, only: [:show, :edit, :update, :destroy]

  # GET /policy_details
  # GET /policy_details.json
  def index
    @policy_details = PolicyDetail.all
  end

  # GET /policy_details/1
  # GET /policy_details/1.json
  def show
  end

  # GET /policy_details/new
  def new
    @policy_detail = PolicyDetail.new
  end

  # GET /policy_details/1/edit
  def edit
  end

  def policy_details_modal
    @policy_detail = PolicyDetail.new
    # @policy_detail = PolicyDetail.find(params[:format])
    # redirect_to show_employee_declaration_investment_declarations_path
  end

  # POST /policy_details
  # POST /policy_details.json
  def create
    @policy_detail = PolicyDetail.new(policy_detail_params)

    respond_to do |format|
      if @policy_detail.save
        format.html { redirect_to @policy_detail, notice: 'Policy detail was successfully created.' }
        format.json { render :show, status: :created, location: @policy_detail }
      else
        format.html { render :new }
        format.json { render json: @policy_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policy_details/1
  # PATCH/PUT /policy_details/1.json
  def update
    respond_to do |format|
      if @policy_detail.update(policy_detail_params)
        format.html { redirect_to @policy_detail, notice: 'Policy detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @policy_detail }
      else
        format.html { render :edit }
        format.json { render json: @policy_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_details/1
  # DELETE /policy_details/1.json
  def destroy
    @policy_detail.destroy
    respond_to do |format|
      format.html { redirect_to policy_details_url, notice: 'Policy detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy_detail
      @policy_detail = PolicyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def policy_detail_params
      params.require(:policy_detail).permit(:investment_declaration_id, :insurer, :policy_no, :relation, :frequency, :premium_amount, :estimated_annual_amount, :actual_annual_amount)
    end
end
