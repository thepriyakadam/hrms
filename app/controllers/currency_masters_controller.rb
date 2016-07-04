class CurrencyMastersController < ApplicationController
  before_action :set_currency_master, only: [:edit, :update, :destroy]

  def index
    @currency_masters = CurrencyMaster.all
    @currency_master = CurrencyMaster.new
    session[:active_tab] ="master"
    session[:active_tab1] ="daily_bill_master_setup"
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
	end

	private

    def set_currency_master
      @currency_master = CurrencyMaster.find(params[:id])
	  end

    def currency_master_params
      params.require(:currency_master).permit(:code, :name, :description)
	  end
end
