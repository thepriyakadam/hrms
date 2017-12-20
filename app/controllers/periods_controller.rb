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

 def period_master
      @periods = Period.all
      respond_to do |f|
      f.js
      f.xls {render template: 'periods/period_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'period_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'periods/period_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_periods_path
      else
     Period.import(params[:file])
     redirect_to import_xl_periods_path, notice: "File imported."
     end
  end

	private

    def set_period
      @period = Period.find(params[:id])
	 end

    def period_params
      params.require(:period).permit(:is_confirm,:name, :from, :to, :status)
	 end
end
