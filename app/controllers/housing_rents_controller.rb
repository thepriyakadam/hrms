class HousingRentsController < ApplicationController
  before_action :set_housing_rent, only: [:show, :edit, :update, :destroy]

  # GET /housing_rents
  # GET /housing_rents.json
  def index
    @housing_rents = HousingRent.all
  end

  # GET /housing_rents/1
  # GET /housing_rents/1.json
  def show
  end

  # GET /housing_rents/new
  def new
    @housing_rent = HousingRent.new
  end

  # GET /housing_rents/1/edit
  def edit
  end

  # POST /housing_rents
  # POST /housing_rents.json
  def create
    @housing_rent = HousingRent.new(housing_rent_params)
    @housing_rent.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @housing_rent.investment_declaration_id)
    @housing_rents = HousingRent.where(investment_declaration_id: @investment_declarations)

    accepted_rent_sum = 0
    
    @housing_rents.each do |hr|
      amount_p = hr.accepted_rent
      accepted_rent_sum = accepted_rent_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: accepted_rent_sum)
    @investment_declarations.update(actual_amt: accepted_rent_sum)

    redirect_to show_employee_declaration_investment_declarations_path
    # @housing_rent = HousingRent.new(housing_rent_params)

    # respond_to do |format|
    #   if @housing_rent.save
    #     format.html { redirect_to @housing_rent, notice: 'Housing rent was successfully created.' }
    #     format.json { render :show, status: :created, location: @housing_rent }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @housing_rent.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /housing_rents/1
  # PATCH/PUT /housing_rents/1.json
  def update
    respond_to do |format|
      if @housing_rent.update(housing_rent_params)
        format.html { redirect_to @housing_rent, notice: 'Housing rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @housing_rent }
      else
        format.html { render :edit }
        format.json { render json: @housing_rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_rents/1
  # DELETE /housing_rents/1.json
  def destroy
    @housing_rent.destroy
    respond_to do |format|
      format.html { redirect_to housing_rents_url, notice: 'Housing rent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing_rent
      @housing_rent = HousingRent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_rent_params
      params.require(:housing_rent).permit(:investment_declaration_id, :metro_city, :estimated_rent, :actual_rent, :accepted_rent, :rejected_rent, :landlord_name, :landlord_pan_no, :address, :month, :year)
    end
end
