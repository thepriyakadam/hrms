class PeriodsController < ApplicationController
  before_action :set_period, only: [:show,:edit, :update, :destroy]

  def index
    @periods = Period.all
    @period = Period.new
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
	end

	def destroy
		@period.destroy
    @periods = Period.all
	end

	private

    def set_period
      @period = Period.find(params[:id])
	  end

    def period_params
      params.require(:period).permit(:name, :from, :to, :status)
	  end
end
