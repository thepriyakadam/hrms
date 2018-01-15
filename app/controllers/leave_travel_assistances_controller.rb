class LeaveTravelAssistancesController < ApplicationController
  before_action :set_leave_travel_assistance, only: [:show, :edit, :update, :destroy]

  # GET /leave_travel_assistances
  # GET /leave_travel_assistances.json
  def index
    @leave_travel_assistances = LeaveTravelAssistance.all
  end

  # GET /leave_travel_assistances/1
  # GET /leave_travel_assistances/1.json
  def show
  end

  # GET /leave_travel_assistances/new
  def new
    @leave_travel_assistance = LeaveTravelAssistance.new
  end

  # GET /leave_travel_assistances/1/edit
  def edit
  end

  # POST /leave_travel_assistances
  # POST /leave_travel_assistances.json
  def create
    @leave_travel_assistance = LeaveTravelAssistance.new(leave_travel_assistance_params)
    @leave_travel_assistance.save
      
    @investment_declarations = InvestmentDeclaration.find_by(id: @leave_travel_assistance.investment_declaration_id)
    @leave_travel_assistances = LeaveTravelAssistance.where(investment_declaration_id: @investment_declarations)

    actual_annual_amount_sum = 0
    
    @leave_travel_assistances.each do |pd|
      amount_p = pd.actual_amt
      actual_annual_amount_sum = actual_annual_amount_sum.to_f + amount_p
   end
    @investment_declarations.update(actual_amt: actual_annual_amount_sum)
    
    # @investment_declarations.update(accepted_amt: actual_annual_amount_sum)


    redirect_to show_employee_declaration_investment_declarations_path
    # @leave_travel_assistance = LeaveTravelAssistance.new(leave_travel_assistance_params)

    # respond_to do |format|
    #   if @leave_travel_assistance.save
    #     format.html { redirect_to @leave_travel_assistance, notice: 'Leave travel assistance was successfully created.' }
    #     format.json { render :show, status: :created, location: @leave_travel_assistance }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @leave_travel_assistance.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /leave_travel_assistances/1
  # PATCH/PUT /leave_travel_assistances/1.json
  def update
    respond_to do |format|
      if @leave_travel_assistance.update(leave_travel_assistance_params)
        format.html { redirect_to @leave_travel_assistance, notice: 'Leave travel assistance was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_travel_assistance }
      else
        format.html { render :edit }
        format.json { render json: @leave_travel_assistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_travel_assistances/1
  # DELETE /leave_travel_assistances/1.json
  def destroy
    @leave_travel_assistance.destroy
    respond_to do |format|
      format.html { redirect_to leave_travel_assistances_url, notice: 'Leave travel assistance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_travel_assistance
      @leave_travel_assistance = LeaveTravelAssistance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_travel_assistance_params
      params.require(:leave_travel_assistance).permit(:investment_declaration_id, :journey_from_date, :journey_to_date, :from_location, :to_location, :person_traveled, :relationship, :travel_mode, :estimated_amt, :actual_amt, :total)
    end
end
