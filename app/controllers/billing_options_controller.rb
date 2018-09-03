class BillingOptionsController < ApplicationController
  before_action :set_billing_option, only: [:show, :edit, :update, :destroy]

  # GET /billing_options
  # GET /billing_options.json
  def index
    @billing_options = BillingOption.all
  end

  # GET /billing_options/1
  # GET /billing_options/1.json
  def show
  end

  # GET /billing_options/new
  def new
    @billing_option = BillingOption.new
     @billing_options = BillingOption.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

  # GET /billing_options/1/edit
  def edit
  end

  # POST /billing_options
  # POST /billing_options.json
  def create
   @billing_option = BillingOption.new(billing_option_params)
   @billing_options =BillingOption.all
    respond_to do |format|
      if @billing_option.save
        @billing_option = BillingOption.new
          format.js { @flag = true }
      else
        flash.now[:alert] = 'Advance Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /billing_options/1
  # PATCH/PUT /billing_options/1.json
  def update
    @billing_option.update(billing_option_params)
    @billing_options = BillingOption.all
    @billing_option = BillingOption.new
  end

  # DELETE /billing_options/1
  # DELETE /billing_options/1.json
  def destroy
    @billing_option.destroy
    @billing_options = BillingOption.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_option
      @billing_option = BillingOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_option_params
      params.require(:billing_option).permit(:expence_opestion_id, :code, :name, :description, :status)
    end
end
