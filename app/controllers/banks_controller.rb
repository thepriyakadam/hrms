class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  # GET /banks/new
  def new
    @bank = Bank.new
    @banks = Bank.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="CompanyType"
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(bank_params)
    @banks = Bank.all
    respond_to do |format|
      if @bank.save
        @bank = Bank.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Bank Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    @bank.update(bank_params)
    @banks = Bank.all
    @bank = Bank.new
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy
    @banks = Bank.all
  end

  def is_confirm
    @bank = Bank.find(params[:bank])
    Bank.find(@bank.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_bank_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bank
    @bank = Bank.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bank_params
    params.require(:bank).permit(:is_confirm,:name, :code, :description)
  end
end
