class MonthlyExpencesController < ApplicationController
  before_action :set_monthly_expence, only: [:show, :edit, :update, :destroy]

  # GET /monthly_expences
  # GET /monthly_expences.json
  def index
    @monthly_expences = MonthlyExpence.all
  end

  # GET /monthly_expences/1
  # GET /monthly_expences/1.json
  def show
  end

  # GET /monthly_expences/new
  def new
    @monthly_expence = MonthlyExpence.new
  end

  # GET /monthly_expences/1/edit
  def edit
  end

  # POST /monthly_expences
  # POST /monthly_expences.json
  def create
    @monthly_expence = MonthlyExpence.new(monthly_expence_params)

    respond_to do |format|
      if @monthly_expence.save
        format.html { redirect_to @monthly_expence, notice: 'Monthly expence was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_expence }
      else
        format.html { render :new }
        format.json { render json: @monthly_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_expences/1
  # PATCH/PUT /monthly_expences/1.json
  def update
    respond_to do |format|
      if @monthly_expence.update(monthly_expence_params)
        format.html { redirect_to @monthly_expence, notice: 'Monthly expence was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_expence }
      else
        format.html { render :edit }
        format.json { render json: @monthly_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_expences/1
  # DELETE /monthly_expences/1.json
  def destroy
    @monthly_expence.destroy
    respond_to do |format|
      format.html { redirect_to monthly_expences_url, notice: 'Monthly expence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_expence
      @monthly_expence = MonthlyExpence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_expence_params
      params.require(:monthly_expence).permit(:expence_date, :amount, :employee_id, :expencess_type_id)
    end
end
