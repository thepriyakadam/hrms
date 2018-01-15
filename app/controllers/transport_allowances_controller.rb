class TransportAllowancesController < ApplicationController
  before_action :set_transport_allowance, only: [:show, :edit, :update, :destroy]

  # GET /transport_allowances
  # GET /transport_allowances.json
  def index
    @transport_allowances = TransportAllowance.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PeriodicComponents"
  end

  # GET /transport_allowances/1
  # GET /transport_allowances/1.json
  def show
  end

  # GET /transport_allowances/new
  def new
    @transport_allowance = TransportAllowance.new
  end

  # GET /transport_allowances/1/edit
  def edit
  end

  # POST /transport_allowances
  # POST /transport_allowances.json
  def create
    @transport_allowance = TransportAllowance.new(transport_allowance_params)

    respond_to do |format|
      if @transport_allowance.save
        format.html { redirect_to @transport_allowance, notice: 'Transport allowance was successfully created.' }
        format.json { render :show, status: :created, location: @transport_allowance }
      else
        format.html { render :new }
        format.json { render json: @transport_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transport_allowances/1
  # PATCH/PUT /transport_allowances/1.json
  def update
    respond_to do |format|
      if @transport_allowance.update(transport_allowance_params)
        format.html { redirect_to @transport_allowance, notice: 'Transport allowance was successfully updated.' }
        format.json { render :show, status: :ok, location: @transport_allowance }
      else
        format.html { render :edit }
        format.json { render json: @transport_allowance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_allowances/1
  # DELETE /transport_allowances/1.json
  def destroy
    @transport_allowance.destroy
    respond_to do |format|
      format.html { redirect_to transport_allowances_url, notice: 'Transport allowance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_allowance
      @transport_allowance = TransportAllowance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_allowance_params
      params.require(:transport_allowance).permit(:employee_id, :option, :amount, :status)
    end
end
