class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]

  def new
    @degree = Degree.new
    @degrees = Degree.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Qualification"
  end

  # GET /degrees/1/edit
  def edit
  end

  # POST /degrees
  # POST /degrees.json
  def create
    @degree = Degree.new(degree_params)
    @degrees = Degree.all
    respond_to do |format|
      if @degree.save
        @degree = Degree.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Degree Already Exist.'
        format.js { @flag = false }
      end
    end
 end
  # PATCH/PUT /degrees/1
  # PATCH/PUT /degrees/1.json
  def update
    @degree.update(degree_params)
    @degrees = Degree.all
    @degree = Degree.new
  end

  # DELETE /degrees/1
  # DELETE /degrees/1.json
  def destroy
    @degree.destroy
    @degrees = Degree.all
  end

  def print_qualification
      @degrees = Degree.all
      respond_to do |f|
      f.js
      f.xls {render template: 'degrees/print_qualification.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'print_qualification',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'degrees/print_qualification.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_degree
    @degree = Degree.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def degree_params
    params.require(:degree).permit(:is_confirm,:name,:code,:description)
  end
end
