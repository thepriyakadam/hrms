class PaymentModesController < ApplicationController
  before_action :set_payment_mode, only: [:show, :edit, :update, :destroy]

  def new
    @payment_mode = PaymentMode.new
    @payment_modes = PaymentMode.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="CompanyType"
  end

  # GET /payment_modes/1/edit
  def edit
  end

  # POST /payment_modes
  # POST /payment_modes.json
  def create
    @payment_mode = PaymentMode.new(payment_mode_params)
    @payment_modes = PaymentMode.all
    respond_to do |format|
      if @payment_mode.save
        @payment_mode = PaymentMode.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Payment Mode Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /payment_modes/1
  # PATCH/PUT /payment_modes/1.json
  def update
    @payment_mode.update(payment_mode_params)
    @payment_modes = PaymentMode.all
    @payment_mode = PaymentMode.new
  end

  # DELETE /payment_modes/1
  # DELETE /payment_modes/1.json
  def destroy
    @payment_mode.destroy
    @payment_modes = PaymentMode.all
  end

  def is_confirm
    @payment_mode = PaymentMode.find(params[:payment_mode])
    PaymentMode.find(@payment_mode.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_payment_mode_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment_mode
    @payment_mode = PaymentMode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_mode_params
    params.require(:payment_mode).permit(:is_confirm,:code, :name, :description)
  end
end
