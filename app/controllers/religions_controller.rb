class ReligionsController < ApplicationController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]

  # GET /religions/new
  def new
    @religion = Religion.new
    @religions = Religion.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /religions/1/edit
  def edit
  end

  # POST /religions
  # POST /religions.json
  def create
    @religion = Religion.new(religion_params)
    @religions = Religion.all
    respond_to do |format|
      if @religion.save
        @religion = Religion.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Religion Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /religions/1
  # PATCH/PUT /religions/1.json
  def update
    @religion.update(religion_params)
    @religions = Religion.all
    @religion = Religion.new
  end

  # DELETE /religions/1
  # DELETE /religions/1.json
  def destroy
    @religion.destroy
    @religions = Religion.all
  end

  def religion_master
     @religions = Religion.all
     respond_to do |f|
      f.js
      f.xls {render template: 'religions/religion_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' religion_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'religions/religion_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_religions_path
      else
     Religion.import(params[:file])
     redirect_to new_religion_path, notice: "File imported."
     end
  end 
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_religion
    @religion = Religion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def religion_params
    params.require(:religion).permit(:is_confirm,:name, :code, :description)
  end
end
