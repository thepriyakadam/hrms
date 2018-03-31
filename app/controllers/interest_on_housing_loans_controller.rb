class InterestOnHousingLoansController < ApplicationController
  before_action :set_interest_on_housing_loan, only: [:show, :edit, :update, :destroy]

  # GET /interest_on_housing_loans
  # GET /interest_on_housing_loans.json
  def index
    @interest_on_housing_loans = InterestOnHousingLoan.all
  end

  # GET /interest_on_housing_loans/1
  # GET /interest_on_housing_loans/1.json
  def show
  end

  # GET /interest_on_housing_loans/new
  def new
    @interest_on_housing_loan = InterestOnHousingLoan.new
  end

  # GET /interest_on_housing_loans/1/edit
  def edit
  end

  # POST /interest_on_housing_loans
  # POST /interest_on_housing_loans.json
  def create
    @interest_on_housing_loan = InterestOnHousingLoan.new(interest_on_housing_loan_params)
    @interest_on_housing_loan.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @interest_on_housing_loan.investment_declaration_id)
    @interest_on_housing_loans = InterestOnHousingLoan.where(investment_declaration_id: @investment_declarations)

    actual_interest_sum = 0
    
    @interest_on_housing_loans.each do |ihl|
      amount_p = ihl.actual_interest
      actual_interest_sum = actual_interest_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: actual_interest_sum)

    redirect_to show_employee_declaration_investment_declarations_path
    # @interest_on_housing_loan = InterestOnHousingLoan.new(interest_on_housing_loan_params)

    # respond_to do |format|
    #   if @interest_on_housing_loan.save
    #     format.html { redirect_to @interest_on_housing_loan, notice: 'Interest on housing loan was successfully created.' }
    #     format.json { render :show, status: :created, location: @interest_on_housing_loan }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @interest_on_housing_loan.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /interest_on_housing_loans/1
  # PATCH/PUT /interest_on_housing_loans/1.json
  def update
    respond_to do |format|
      if @interest_on_housing_loan.update(interest_on_housing_loan_params)
        format.html { redirect_to @interest_on_housing_loan, notice: 'Interest on housing loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest_on_housing_loan }
      else
        format.html { render :edit }
        format.json { render json: @interest_on_housing_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_on_housing_loans/1
  # DELETE /interest_on_housing_loans/1.json
  def destroy
    @interest_on_housing_loan.destroy
    respond_to do |format|
      format.html { redirect_to interest_on_housing_loans_url, notice: 'Interest on housing loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_on_housing_loan
      @interest_on_housing_loan = InterestOnHousingLoan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_on_housing_loan_params
      params.require(:interest_on_housing_loan).permit(:investment_declaration_id, :property_name, :property_address, :date_of_possession, :lender_name, :lender_address, :lender_pan_no, :estimated_interest, :actual_interest, :total_interest)
    end
end
