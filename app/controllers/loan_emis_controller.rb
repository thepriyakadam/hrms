class LoanEmisController < ApplicationController
  before_action :set_loan_emi, only: [:show, :edit, :update, :destroy]

  # GET /loan_emis
  # GET /loan_emis.json
  def index
    @loan_emis = LoanEmi.all
  end

  # GET /loan_emis/1
  # GET /loan_emis/1.json
  def show
  end

  # GET /loan_emis/new
  def new
    @loan_emi = LoanEmi.new
  end

  # GET /loan_emis/1/edit
  def edit
  end

  # POST /loan_emis
  # POST /loan_emis.json
  def create
    @loan_emi = LoanEmi.new(loan_emi_params)

    respond_to do |format|
      if @loan_emi.save
        format.html { redirect_to @loan_emi, notice: 'Loan emi was successfully created.' }
        format.json { render :show, status: :created, location: @loan_emi }
      else
        format.html { render :new }
        format.json { render json: @loan_emi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_emis/1
  # PATCH/PUT /loan_emis/1.json
  def update
    respond_to do |format|
      if @loan_emi.update(loan_emi_params)
        format.html { redirect_to @loan_emi, notice: 'Loan emi was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_emi }
      else
        format.html { render :edit }
        format.json { render json: @loan_emi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_emis/1
  # DELETE /loan_emis/1.json
  def destroy
    @loan_emi.destroy
    respond_to do |format|
      format.html { redirect_to loan_emis_url, notice: 'Loan emi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_emi
      @loan_emi = LoanEmi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_emi_params
      params.require(:loan_emi).permit(:loan_approval_id, :date, :emi_amount, :status)
    end
end
