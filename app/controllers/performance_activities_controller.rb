class PerformanceActivitiesController < ApplicationController
  before_action :set_performance_activity, only: [:show, :edit, :update, :destroy]

  def index
  end
  
  def new
    @performance_activity = PerformanceActivity.new
    @performance_activities = PerformanceActivity.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Performance"
  end

  # GET /performance_activities/1/edit
  def edit
  end

  # POST /performance_activities
  # POST /performance_activities.json
  def create
    @performance_activity = PerformanceActivity.new(performance_activity_params)
    @performance_activities = PerformanceActivity.all
    respond_to do |format|
      if @performance_activity.save
        @performance_activity = PerformanceActivity.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Performance Activity Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /performance_activities/1
  # PATCH/PUT /performance_activities/1.json
  def update
    @performance_activity.update(performance_activity_params)
    @performance_activity = PerformanceActivity.new
    @performance_activities = PerformanceActivity.all   
  end

  # DELETE /performance_activities/1
  # DELETE /performance_activities/1.json
  def destroy
    @performance_activity.destroy
    @performance_activities = PerformanceActivity.all 
  end

  def is_confirm
    @performance_activity = PerformanceActivity.find(params[:performance_activity])
    PerformanceActivity.find(@performance_activity.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_performance_activity_path
  end

    def performance_activity
      @performance_activities = PerformanceActivity.all
      respond_to do |f|
      f.js
      f.xls {render template: 'performance_activities/performance_activity.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'performance_activity',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'performance_activities/performance_activity.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_performance_activities_path
      else
     PerformanceActivity.import(params[:file])
     redirect_to import_xl_performance_activities_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_activity
      @performance_activity = PerformanceActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_activity_params
      params.require(:performance_activity).permit(:is_confirm,:code, :name, :description)
    end
end
