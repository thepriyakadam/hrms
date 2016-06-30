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
  end

  
  def edit
  end

  
  def create
    @year = Year.new(year_params)
    @years = Year.all
    respond_to do |format|
      if year.save
         year = Year.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Year Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /about_bosses/1
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:name)
    end
end
