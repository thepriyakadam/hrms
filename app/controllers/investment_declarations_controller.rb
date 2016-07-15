class InvestmentDeclarationsController < ApplicationController
  before_action :set_investment_declaration, only: [:show, :edit, :update, :destroy]

  # GET /investment_declarations
  # GET /investment_declarations.json
  def index
    @investment_declarations = InvestmentDeclaration.all
  end

  # GET /investment_declarations/1
  # GET /investment_declarations/1.json
  def show
  end

  # GET /investment_declarations/new
  def new
    @investment_declaration = InvestmentDeclaration.new
  end

  # GET /investment_declarations/1/edit
  def edit
  end

  # POST /investment_declarations
  # POST /investment_declarations.json
  def create
    @investment_declaration = InvestmentDeclaration.new(investment_declaration_params)

    respond_to do |format|
      if @investment_declaration.save
        format.html { redirect_to @investment_declaration, notice: 'Investment declaration was successfully created.' }
        format.json { render :show, status: :created, location: @investment_declaration }
      else
        format.html { render :new }
        format.json { render json: @investment_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investment_declarations/1
  # PATCH/PUT /investment_declarations/1.json
  def update
    respond_to do |format|
      if @investment_declaration.update(investment_declaration_params)
        format.html { redirect_to @investment_declaration, notice: 'Investment declaration was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment_declaration }
      else
        format.html { render :edit }
        format.json { render json: @investment_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_declarations/1
  # DELETE /investment_declarations/1.json
  def destroy
    @investment_declaration.destroy
    respond_to do |format|
      format.html { redirect_to investment_declarations_url, notice: 'Investment declaration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_declaration
      @investment_declaration = InvestmentDeclaration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_declaration_params
      params.require(:investment_declaration).permit(:date, :investment_head_id, :amount, :employee_id, :status)
    end
end
