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
  end

  # GET /billing_options/1/edit
  def edit
  end

  # POST /billing_options
  # POST /billing_options.json
  def create
    @billing_option = BillingOption.new(billing_option_params)

    respond_to do |format|
      if @billing_option.save
        format.html { redirect_to @billing_option, notice: 'Billing option was successfully created.' }
        format.json { render :show, status: :created, location: @billing_option }
      else
        format.html { render :new }
        format.json { render json: @billing_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_options/1
  # PATCH/PUT /billing_options/1.json
  def update
    respond_to do |format|
      if @billing_option.update(billing_option_params)
        format.html { redirect_to @billing_option, notice: 'Billing option was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing_option }
      else
        format.html { render :edit }
        format.json { render json: @billing_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_options/1
  # DELETE /billing_options/1.json
  def destroy
    @billing_option.destroy
    respond_to do |format|
      format.html { redirect_to billing_options_url, notice: 'Billing option was successfully destroyed.' }
      format.json { head :no_content }
    end
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
