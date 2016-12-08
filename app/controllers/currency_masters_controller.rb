class CurrencyMastersController < ApplicationController
  before_action :set_currency_master, only: [:edit, :update, :destroy]

  def index
    @currency_masters = CurrencyMaster.all
    @currency_master = CurrencyMaster.new
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "TravelSetup"
  end

	def create
    @currency_master = CurrencyMaster.new(currency_master_params)
		if @currency_master.save
	    @currency_master = CurrencyMaster.new
	    @currency_masters = CurrencyMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @currency_master.update(currency_master_params)
     @currency_master = CurrencyMaster.new
     @currency_masters = CurrencyMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @currency_master.destroy
    @currency_masters = CurrencyMaster.all
    redirect_to currency_masters_path
	end

	def is_confirm
    @currency_master = CurrencyMaster.find(params[:currency_master])
    CurrencyMaster.find(@currency_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to currency_masters_path
  end

	private

    def set_currency_master
      @currency_master = CurrencyMaster.find(params[:id])
	  end

    def currency_master_params
      params.require(:currency_master).permit(:is_confirm,:code, :name, :description)
	  end
end
