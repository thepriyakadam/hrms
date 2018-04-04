class PolicyDetailsController < ApplicationController
  before_action :set_policy_detail, only: [:show, :edit, :update, :destroy]

  # GET /policy_details
  # GET /policy_details.json
  def index
    @policy_details = PolicyDetail.all
    @investment_declarations = InvestmentDeclaration.all
    @investment_declaration = InvestmentDeclaration.find(params[:investment_declaration_id])

  end

  # GET /policy_details/1
  # GET /policy_details/1.json
  def show
  end

  # GET /policy_details/new
  def new
    @policy_detail = PolicyDetail.new
    @investment_declaration = InvestmentDeclaration.find(params[:format])
  end

  # GET /policy_details/1/edit
  def edit
    @investment_declaration = @policy_detail.investment_declaration
  end

  # def policy_details_modal
  #   # @policy_detail = PolicyDetail.new
  #   @investment_declarations = InvestmentDeclaration.find(params[:id])
  #   @policy_detail = PolicyDetail.new(policy_detail_params)
  #   @policy_details = PolicyDetail.all
  #   if @policy_detail.save
  #     @policy_detail = PolicyDetail.new
  #     flash[:notice] = 'Policy detail is saved Successfully'
  #   end
  #   redirect_to new_investment_declaration_path 
    
  #   # @policy_detail = PolicyDetail.find(params[:format])
  # end
  # end

  def policy_details_modal
    @policy_detail = PolicyDetail.new
    # @policy_detail = PolicyDetail.find(params[:format])
    # redirect_to show_employee_declaration_investment_declarations_path
  end

  # POST /policy_details
  # POST /policy_details.json
  def create
    # byebug
    #@investment_declarations = InvestmentDeclaration.all

    @policy_detail = PolicyDetail.new(policy_detail_params)
    @policy_detail.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @policy_detail.investment_declaration_id)
    @policy_details = PolicyDetail.where(investment_declaration_id: @investment_declarations)

    actual_annual_amount_sum = 0
    
    @policy_details.each do |pd|
      amount_p = pd.actual_annual_amount
      actual_annual_amount_sum = actual_annual_amount_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: actual_annual_amount_sum)
    
     @investment_declarations.update(accepted_amt: actual_annual_amount_sum)


    redirect_to show_employee_declaration_investment_declarations_path
       
  end

  def approve_policy_details
     @investment_declarations = InvestmentDeclaration.find_by(id: @policy_detail.investment_declaration_id)
    @policy_details = PolicyDetail.where(investment_declaration_id: @investment_declarations)

    actual_annual_amount_sum = 0
    
    @policy_details.each do |pd|
      amount_p = pd.actual_annual_amount
      actual_annual_amount_sum = actual_annual_amount_sum.to_f + amount_p
   end
    @investment_declarations.update(accepted_amt: actual_annual_amount_sum)

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