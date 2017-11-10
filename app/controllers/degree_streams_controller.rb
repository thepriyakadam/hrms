class DegreeStreamsController < ApplicationController
  before_action :set_degree_stream, only: [:show, :edit, :update, :destroy]

  def new
    @degree_stream = DegreeStream.new
    @degree_streams = DegreeStream.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Qualification"
  end

  # GET /degree_streams/1/edit
  def edit
  end

  # POST /degree_streams
  # POST /degree_streams.json
  def create
    @degree_stream = DegreeStream.new(degree_stream_params)
    @degree_streams = DegreeStream.all
    respond_to do |format|
      if @degree_stream.save
        @degree_stream = DegreeStream.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Blood Group Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /degree_streams/1
  # PATCH/PUT /degree_streams/1.json
  def update
    @degree_stream.update(degree_stream_params)
    @degree_streams = DegreeStream.all
    @degree_stream = DegreeStream.new
  end

  # DELETE /degree_streams/1
  # DELETE /degree_streams/1.json
  def destroy
    @degree_stream.destroy
    @degree_streams = DegreeStream.all
  end

  def specialization_master
      @degree_streams = DegreeStream.all
      respond_to do |f|
      f.js
      f.xls {render template: 'degree_streams/specialization_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'specialization_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'degree_streams/specialization_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
  end
end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_degree_stream
    @degree_stream = DegreeStream.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def degree_stream_params
    params.require(:degree_stream).permit(:is_confirm,:name,:code,:description)
  end
end
