class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]

  def new
    @university = University.new
    @universities = University.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Qualification"
  end

  # GET /universities/1/edit
  def edit
  end

  def show
    
  end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(university_params)
    @universities = University.all
    respond_to do |format|
      if @university.save
        @university = University.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'University Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    @university.update(university_params)
    @universities = University.all
    @university = University.new
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    @universities = University.all
  end

  def university_master
      @universities = University.all
      respond_to do |f|
      f.js
      f.xls {render template: 'universities/university_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'university_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'universities/university_master.pdf.erb',
        show_as_html: params[:debug].present?
  end
end
end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_universities_path
      else
     University.import(params[:file])
     redirect_to import_xl_universities_path, notice: "File imported."
     end
  end

  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_university
    @university = University.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def university_params
    params.require(:university).permit(:is_confirm,:name,:code,:description)
  end
end
