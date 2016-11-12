class DearnessAllowancesController < ApplicationController
  before_action :set_dearness_allowance, only: [:show, :edit, :update, :destroy]

  # GET /dearness_allowances
  # GET /dearness_allowances.json
  def index
    @dearness_allowances = DearnessAllowance.all
  end

  # GET /dearness_allowances/1
  # GET /dearness_allowances/1.json
  def show
  end

  # GET /dearness_allowances/new
  def new
    @dearness_allowance = DearnessAllowance.new
  end

  # GET /dearness_allowances/1/edit
  def edit
  end

  # POST /dearness_allowances
  # POST /dearness_allowances.json
  def create
    @dearness_allowance = DearnessAllowance.new(dearness_allowance_params)

    respond_to do |format|
      if @dearness_allowance.save
        format.html { redirect_to @dearness_allowance, notice: 'Dearness allowance was successfully created.' }
        format.json { render :show, status: :created, location: @dearness_allowance }
      else
        format.html { render :new }
        format.json { render json: @dearness_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dearness_allowances/1
  # PATCH/PUT /dearness_allowances/1.json
  def update
    respond_to do |format|
      if @dearness_allowance.update(dearness_allowance_params)
        format.html { redirect_to @dearness_allowance, notice: 'Dearness allowance was successfully updated.' }
        format.json { render :show, status: :ok, location: @dearness_allowance }
      else
        format.html { render :edit }
        format.json { render json: @dearness_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dearness_allowances/1
  # DELETE /dearness_allowances/1.json
  def destroy
    @dearness_allowance.destroy
    respond_to do |format|
      format.html { redirect_to dearness_allowances_url, notice: 'Dearness allowance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dearness_allowance
      @dearness_allowance = DearnessAllowance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dearness_allowance_params
      params.require(:dearness_allowance).permit(:base_component, :minimum_wages, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end
