class LoanTypesController < ApplicationController
  before_action :set_loan_type, only: [:show, :edit, :update, :destroy]

  # GET /loan_types
  # GET /loan_types.json
  def index
    @loan_type = LoanType.new
    @loan_types = LoanType.all
  end

  # GET /loan_types/1
  # GET /loan_types/1.json
  def show
  end

  # GET /loan_types/new
  def new
    @loan_type = LoanType.new
    @loan_types = LoanType.all
  end

  # GET /loan_types/1/edit
  def edit
  end

  # POST /loan_types
  # POST /loan_types.json
  def create
    @loan_type = LoanType.new(loan_type_params)
    @loan_types = LoanType.all
    respond_to do |format|
      if @loan_type.save
         @loan_type = LoanType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /loan_types/1
  # PATCH/PUT /loan_types/1.json
  def update
    @loan_type.update(loan_type_params)
    @loan_types = LoanType.all
    @loan_type = LoanType.new
  end

  # DELETE /loan_types/1
  # DELETE /loan_types/1.json
  def destroy
    @loan_type.destroy
    @loan_types = LoanType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_type
      @loan_type = LoanType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_type_params
      params.require(:loan_type).permit(:code, :name, :description, :from, :to, :interest_rate,:interest_type,:status)
    end
end
