class PeriodsController < ApplicationController
  before_action :set_period, only: [:show,:edit, :update, :destroy]

  def index
    @periods = Period.all
    @period = Period.new
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Performance"
  end

	def create
    @period = Period.new(period_params)
    @periods = Period.all
    respond_to do |format|
	if @period.save
    @period = Period.new
    format.js { @flag = true }
	else
	  flash.now[:alert] = 'Period Already Exist.'
      format.js { @flag = false }
	end
	end
	end

	def edit
	end

	def update
	@period.update(period_params)
    @period = Period.new
    @periods = Period.all
    #redirect_to periods_path
	end

	def destroy
	@period.destroy
    @periods = Period.all
	end

  def is_confirm
    @period = Period.find(params[:period])
    Period.find(@period.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to periods_path
  end

	private

    def set_period
      @period = Period.find(params[:id])
	 end

    def period_params
      params.require(:period).permit(:is_confirm,:name, :from, :to, :status)
	 end
end
