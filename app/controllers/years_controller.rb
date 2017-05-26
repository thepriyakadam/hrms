class YearsController < ApplicationController
 before_action :set_year, only: [:show, :edit, :update, :destroy]

  
  def index
    @year = Year.all
  end

  def show

  end

 
  def new
    @year = Year.new
    @years = Year.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="Qualification"
  end

  
  def edit
  end

  
  def create
    @year = Year.new(year_params)
      if @year.save
         @year = Year.new
         @years = Year.all
         @flag=true 
      else
         @flag=false
      end
  end


  # PAT
  # PATCH/PUT /about_bosses/1.json
  def update
    @year.update(year_params)
    @years = Year.all
    @year = Year.new
  end

  # DELETE /about_bosses/1
  # DELETE /about_bosses/1.json
  def destroy
    @year.destroy
    @years = Year.all
  end

  def is_confirm
    @year = Year.find(params[:year])
    Year.find(@year.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_year_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:is_confirm,:name)
    end
end
