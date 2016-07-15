class RewardRecognitionsController < ApplicationController
  before_action :set_reward_recognition, only: [:show, :edit, :update, :destroy]

  # GET /reward_recognitions
  # GET /reward_recognitions.json
  def index
    @reward_recognitions = RewardRecognition.all
  end

  # GET /reward_recognitions/1
  # GET /reward_recognitions/1.json
  def show
  end

  # GET /reward_recognitions/new
  def new
    @reward_recognition = RewardRecognition.new
  end

  # GET /reward_recognitions/1/edit
  def edit
  end

  # POST /reward_recognitions
  # POST /reward_recognitions.json
  def create
    @reward_recognition = RewardRecognition.new(reward_recognition_params)

    respond_to do |format|
      if @reward_recognition.save
        format.html { redirect_to @reward_recognition, notice: 'Reward recognition was successfully created.' }
        format.json { render :show, status: :created, location: @reward_recognition }
      else
        format.html { render :new }
        format.json { render json: @reward_recognition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_recognitions/1
  # PATCH/PUT /reward_recognitions/1.json
  def update
    respond_to do |format|
      if @reward_recognition.update(reward_recognition_params)
        format.html { redirect_to @reward_recognition, notice: 'Reward recognition was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_recognition }
      else
        format.html { render :edit }
        format.json { render json: @reward_recognition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_recognitions/1
  # DELETE /reward_recognitions/1.json
  def destroy
    @reward_recognition.destroy
    respond_to do |format|
      format.html { redirect_to reward_recognitions_url, notice: 'Reward recognition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_recognition
      @reward_recognition = RewardRecognition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_recognition_params
      params.require(:reward_recognition).permit(:reward_type_id, :type, :reward_owner_id, :cost_unit, :communication)
    end
end
