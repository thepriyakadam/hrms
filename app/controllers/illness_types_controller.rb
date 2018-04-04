class IllnessTypesController < ApplicationController
  before_action :set_illness_type, only: [:show, :edit, :update, :destroy]

  # GET /illness_types
  # GET /illness_types.json

  # GET /illness_types/1
  # GET /illness_types/1.json
  def show
  end

  # GET /illness_types/new
  def new
    @illness_type = IllnessType.new
    @illness_types = IllnessType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /illness_types/1/edit
  def edit
  end

  # POST /illness_types
  # POST /illness_types.json
  def create
    @illness_type = IllnessType.new(illness_type_params)
      if @illness_type.save
         @illness_type = IllnessType.new
         @illness_types = IllnessType.all
         @flag=true 
      else
         @flag=false
      end
  end

  # PATCH/PUT /illness_types/1
  # PATCH/PUT /illness_types/1.json
  def update
    @illness_type.update(illness_type_params)
    @illness_type = IllnessType.new
    @illness_types = IllnessType.all
  end

  # DELETE /illness_types/1
  # DELETE /illness_types/1.json
  def destroy
    @illness_type.destroy
    @illness_types = IllnessType.all
  end

  def illness_type_master
     @illness_types = IllnessType.all
     respond_to do |f|
      f.js
      f.xls {render template: 'illness_types/illness_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' illness_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'illness_types/illness_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_illness_types_path
      else
     IllnessType.import(params[:file])
     redirect_to new_illness_type_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_illness_type
      @illness_type = IllnessType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def illness_type_params
      params.require(:illness_type).permit(:is_confirm,:code, :name, :description)
    end
end
