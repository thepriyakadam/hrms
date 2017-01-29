class OverallRatingsController < ApplicationController
  before_action :set_overall_rating, only: [:show, :edit, :update, :destroy]

  # GET /overall_ratings
  # GET /overall_ratings.json
  def index
    @overall_ratings = OverallRating.all
  end

  # GET /overall_ratings/1
  # GET /overall_ratings/1.json
  def show
  end

  # GET /overall_ratings/new
  def new
    @overall_rating = OverallRating.new
  end

  # GET /overall_ratings/1/edit
  def edit
  end

  # POST /overall_ratings
  # POST /overall_ratings.json
  def create
    @overall_rating = OverallRating.new(overall_rating_params)

    respond_to do |format|
      if @overall_rating.save
        format.html { redirect_to @overall_rating, notice: 'Overall rating was successfully created.' }
        format.json { render :show, status: :created, location: @overall_rating }
      else
        format.html { render :new }
        format.json { render json: @overall_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overall_ratings/1
  # PATCH/PUT /overall_ratings/1.json
  def update
    respond_to do |format|
      if @overall_rating.update(overall_rating_params)
        format.html { redirect_to @overall_rating, notice: 'Overall rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @overall_rating }
      else
        format.html { render :edit }
        format.json { render json: @overall_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overall_ratings/1
  # DELETE /overall_ratings/1.json
  def destroy
    @overall_rating.destroy
    respond_to do |format|
      format.html { redirect_to overall_ratings_url, notice: 'Overall rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def modal_self
    @overall_rating = OverallRating.find(params[:format])
  end

  def update_modal_self
    @overall_rating = OverallRating.find(params[:id])
    @overall_rating.update(overall_rating_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overall_rating
      @overall_rating = OverallRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overall_rating_params
      params.require(:overall_rating).permit(:goal_rating_sheet_id, :employee_id, :ro1_id, :ro2_id, :final_id, :ro1_rating_id, :ro1_comment, :ro2_rating_id, :ro2_comment, :final_rating_id, :final_comment, :promotion, :increment, :final_ctc, :appraisee_comment)
    end
end
