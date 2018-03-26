class ExpencessTypesController < ApplicationController
  before_action :set_expencess_type, only: [:show, :edit, :update, :destroy]

  # GET /expencess_types/new
  def new
    @expencess_type = ExpencessType.new
    @expencess_types = ExpencessType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="PayrollComponent"
  end

  # GET /expencess_types/1/edit
  def edit
  end

  # POST /expencess_types
  # POST /expencess_types.json
  def create
    @expencess_type = ExpencessType.new(expencess_type_params)
    @expencess_types = ExpencessType.all
    respond_to do |format|
      if @expencess_type.save
        @expencess_type = ExpencessType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Expence Type Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /expencess_types/1
  # PATCH/PUT /expencess_types/1.json
  def update
    @expencess_type.update(expencess_type_params)
    @expencess_types = ExpencessType.all
    @expencess_type = ExpencessType.new
  end

  # DELETE /expencess_types/1
  # DELETE /expencess_types/1.json
  def destroy
    @expencess_type.destroy
    @expencess_types = ExpencessType.all
  end
   
    def expence_type_master
     @expencess_types = ExpencessType.all
     respond_to do |f|
      f.js
      f.xls {render template: 'expencess_types/expence_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' expence_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'expencess_types/expence_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expencess_type
    @expencess_type = ExpencessType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expencess_type_params
    params.require(:expencess_type).permit(:is_confirm,:code, :name, :description)
  end
end
