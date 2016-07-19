class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings/new
  def new
    @rating = Rating.new
    @ratings = Rating.all
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
   @rating = Rating.new(rating_params)
    @ratings = Rating.all
    respond_to do |format|
      if @rating.save
         @rating = Rating.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Rating Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    @rating.update(rating_params)
    @ratings = Rating.all
    @rating = Rating.new
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    @ratings = Rating.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:value, :discription)
    end
end
