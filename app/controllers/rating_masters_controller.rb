class RatingMastersController < ApplicationController
  before_action :set_rating_master, only: [:show, :edit, :update, :destroy]

  # GET /rating_masters
  # GET /rating_masters.json
  def index
    @rating_masters = RatingMaster.all
  end

  # GET /rating_masters/1
  # GET /rating_masters/1.json
  def show
  end

  # GET /rating_masters/new
  def new
    @rating_master = RatingMaster.new
    @rating_masters = RatingMaster.all
  end

  # GET /rating_masters/1/edit
  def edit
  end

  # POST /rating_masters
  # POST /rating_masters.json
  def create
    @rating_master = RatingMaster.new(rating_master_params)
      if @rating_master.save
        @flag = true
        @rating_masters = RatingMaster.all
        @rating_master = RatingMaster.new
      else
        @flag = false
    end
  end

  # PATCH/PUT /rating_masters/1
  # PATCH/PUT /rating_masters/1.json
  def update
      if @rating_master.update(rating_master_params)
        @flag = true
        @rating_masters = RatingMaster.all
        @rating_master = RatingMaster.new
      else
        @flag = false
    end
  end

  # DELETE /rating_masters/1
  # DELETE /rating_masters/1.json
  def destroy
    @rating_master.destroy
    respond_to do |format|
      format.html { redirect_to rating_masters_url, notice: 'Rating master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_master
      @rating_master = RatingMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_master_params
      params.require(:rating_master).permit(:code, :description)
    end
end
