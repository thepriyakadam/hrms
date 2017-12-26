class MedicleReimbursementsController < ApplicationController
  before_action :set_medicle_reimbursement, only: [:show, :edit, :update, :destroy]

  # GET /medicle_reimbursements
  # GET /medicle_reimbursements.json
  def index
    @medicle_reimbursements = MedicleReimbursement.all
  end

  # GET /medicle_reimbursements/1
  # GET /medicle_reimbursements/1.json
  def show
  end

  # GET /medicle_reimbursements/new
  def new
    @medicle_reimbursement = MedicleReimbursement.new
  end

  # GET /medicle_reimbursements/1/edit
  def edit
  end

  # POST /medicle_reimbursements
  # POST /medicle_reimbursements.json
  def create
    @medicle_reimbursement = MedicleReimbursement.new(medicle_reimbursement_params)
    @medicle_reimbursement.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @medicle_reimbursement.investment_declaration_id)
    @medicle_reimbursements = MedicleReimbursement.where(investment_declaration_id: @investment_declarations)

    toatal_amt_sum = 0
    
    @medicle_reimbursements.each do |mr|
      amount_p = mr.toatal_amt
      toatal_amt_sum = toatal_amt_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: toatal_amt_sum)

    redirect_to show_employee_declaration_investment_declarations_path

    # @medicle_reimbursement = MedicleReimbursement.new(medicle_reimbursement_params)

    # respond_to do |format|
    #   if @medicle_reimbursement.save
    #     format.html { redirect_to @medicle_reimbursement, notice: 'Medicle reimbursement was successfully created.' }
    #     format.json { render :show, status: :created, location: @medicle_reimbursement }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @medicle_reimbursement.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /medicle_reimbursements/1
  # PATCH/PUT /medicle_reimbursements/1.json
  def update
    respond_to do |format|
      if @medicle_reimbursement.update(medicle_reimbursement_params)
        format.html { redirect_to @medicle_reimbursement, notice: 'Medicle reimbursement was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicle_reimbursement }
      else
        format.html { render :edit }
        format.json { render json: @medicle_reimbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicle_reimbursements/1
  # DELETE /medicle_reimbursements/1.json
  def destroy
    @medicle_reimbursement.destroy
    respond_to do |format|
      format.html { redirect_to medicle_reimbursements_url, notice: 'Medicle reimbursement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicle_reimbursement
      @medicle_reimbursement = MedicleReimbursement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicle_reimbursement_params
      params.require(:medicle_reimbursement).permit(:investment_declaration_id, :bill_no, :bill_date, :name_on_invoice, :estimated_amt, :actual_amt, :toatal_amt)
    end
end
