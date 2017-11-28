class NationalitiesController < ApplicationController
  before_action :set_nationality, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

  def new
    @nationality = Nationality.new
    @nationalities = Nationality.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  def edit
  end

  def create
    @nationality = Nationality.new(nationality_params)
    @nationalities = Nationality.all
    respond_to do |format|
      if @nationality.save
        @nationality = Nationality.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Nationality Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  def update
    @nationality.update(nationality_params)
    @nationalities = Nationality.all
    @nationality = Nationality.new
  end

  def destroy
    @nationality.destroy
    @nationalities = Nationality.all
  end

  def nationality_master
     @nationalities = Nationality.all
     respond_to do |f|
      f.js
      f.xls {render template: 'nationalities/nationality_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' nationality_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'nationalities/nationality_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nationality
    @nationality = Nationality.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nationality_params
    params.require(:nationality).permit(:is_confirm,:name,:code,:description)
  end
end
