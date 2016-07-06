class WeekoffMastersController < ApplicationController
  before_action :set_weekoff_master, only: [:edit, :update, :destroy]

  def index
    @weekoff_masters = WeekoffMaster.all
    @weekoff_master = WeekoffMaster.new
  end

	def create
    @weekoff_master = WeekoffMaster.new(weekoff_master_params)
		if @weekoff_master.save
	    @weekoff_master = WeekoffMaster.new
	    @weekoff_masters = WeekoffMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @weekoff_master.update(weekoff_master_params)
     @weekoff_master = WeekoffMaster.new
     @weekoff_masters = WeekoffMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @weekoff_master.destroy
    @weekoff_masters = WeekoffMaster.all
	end

	private

    def set_weekoff_master
      @weekoff_master = WeekoffMaster.find(params[:id])
	  end

    def weekoff_master_params
      params.require(:weekoff_master).permit(:day)
	  end
end
