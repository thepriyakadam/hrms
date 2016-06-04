class PeriodsController < ApplicationController
  before_action :set_period, only: [:edit, :update, :destroy]

  def index
    @periods = Period.all
    @period = Period.new
  end

	def create
    @period = Period.new(period_params)
		if @period.save
	    @period = Period.new
	    @periods = Period.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @period.update(period_params)
     @period = Period.new
     @periods = Period.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
		@period.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to periods_path
	end

	private

    def set_period
      @period = Period.find(params[:id])
	  end

    def period_params
      params.require(:period).permit(:name, :from, :to, :status)
	  end
end
