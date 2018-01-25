class IncomeLossHousePropertiesController < ApplicationController
  before_action :set_income_loss_house_property, only: [:show, :edit, :update, :destroy]

  # GET /income_loss_house_properties
  # GET /income_loss_house_properties.json
  def index
    @income_loss_house_properties = IncomeLossHouseProperty.all
  end

  # GET /income_loss_house_properties/1
  # GET /income_loss_house_properties/1.json
  def show
  end

  # GET /income_loss_house_properties/new
  def new
    @income_loss_house_property = IncomeLossHouseProperty.new
  end

  # GET /income_loss_house_properties/1/edit
  def edit
    # @investment_declaration = @income_loss_house_property.investment_declaration
  end

  # POST /income_loss_house_properties
  # POST /income_loss_house_properties.json
  def create
    @income_loss_house_property = IncomeLossHouseProperty.new(income_loss_house_property_params)
    @income_loss_house_property.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @income_loss_house_property.investment_declaration_id)
    @income_loss_house_properties = IncomeLossHouseProperty.where(investment_declaration_id: @investment_declarations)

    @actual_total_amt_sum = 0
    
    @income_loss_house_properties.each do |ilhp|
      amount_p = ilhp.actual_total_amt
      @actual_total_amt_sum = @actual_total_amt_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: @actual_total_amt_sum)
    # @investment_declarations.update(accepted_amt: @actual_total_amt_sum)

    redirect_to show_employee_declaration_investment_declarations_path
    # @income_loss_house_property = IncomeLossHouseProperty.new(income_loss_house_property_params)

    # respond_to do |format|
    #   if @income_loss_house_property.save
    #     format.html { redirect_to @income_loss_house_property, notice: 'Income loss house property was successfully created.' }
    #     format.json { render :show, status: :created, location: @income_loss_house_property }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @income_loss_house_property.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /income_loss_house_properties/1
  # PATCH/PUT /income_loss_house_properties/1.json
  def update
    respond_to do |format|
      if @income_loss_house_property.update(income_loss_house_property_params)
        format.html { redirect_to @income_loss_house_property, notice: 'Income loss house property was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_loss_house_property }
      else
        format.html { render :edit }
        format.json { render json: @income_loss_house_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_loss_house_properties/1
  # DELETE /income_loss_house_properties/1.json
  def destroy
    @income_loss_house_property.destroy
    respond_to do |format|
      format.html { redirect_to income_loss_house_properties_url, notice: 'Income loss house property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_loss_house_property
      @income_loss_house_property = IncomeLossHouseProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_loss_house_property_params
      params.require(:income_loss_house_property).permit(:investment_declaration_id, :property_type, :rental_income, :less_taxes, :less_repairs, :income, :less_interest, :less_pre_emi_interest, :estimated_total_amt, :actual_total_amt, :total)
    end
end
