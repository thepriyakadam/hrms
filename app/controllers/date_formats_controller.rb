class DateFormatsController < ApplicationController
  before_action :set_date_format, only: [:edit, :update, :destroy]

  def index
    @date_formats = DateFormat.all
    @date_format = DateFormat.new
  end

	def create
    @date_format = DateFormat.new(date_format_params)
		if @date_format.save
	    @date_format = DateFormat.new
	    @date_formats = DateFormat.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @date_format.update(date_format_params)
     @date_format = DateFormat.new
     @date_formats = DateFormat.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @date_format.destroy
    @date_formats = DateFormat.all
	end

	def activee
		@date_format = DateFormat.find(params[:date_format][:name])
		@date_format.update(is_active: true)
		flash[:notice] = 'Date Format Activated'
        redirect_to active_date_formats_path
	end

	private

    def set_date_format
      @date_format = DateFormat.find(params[:id])
	  end

    def date_format_params
      params.require(:date_format).permit(:name, :value)
	  end
end
