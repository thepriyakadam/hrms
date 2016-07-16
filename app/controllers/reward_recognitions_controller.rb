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
    @reward_recognitions = RewardRecognition.all
  end

  # GET /reward_recognitions/1/edit
  def edit
  end

  # POST /reward_recognitions
  # POST /reward_recognitions.json

 # def create
 #    @reward_recognition = RewardRecognition.new(reward_recognition_params)
 #    @reward_recognitions = RewardRecognition.all
 #    respond_to do |format|
 #      if @reward_recognition.save
 #        @reward_recognition = RewardRecognition.new
 #        format.js { @flag = true }
 #      else
 #        flash.now[:alert] = 'Reward Recognition Already Exist.'
 #        format.js { @flag = false }
 #      end
 #    end
 #  end


 def create
      @reward_recognition = RewardRecognition.new(reward_recognition_params)
      @reward_recognitions = RewardRecognition.all
       if @reward_recognition.save
         @reward_recognition = RewardRecognition.new
       end
       flash[:notice] = 'Reward Recognition saved Successfully.' 
       redirect_to new_reward_recognition_path
        
   end
  # PATCH/PUT /reward_recognitions/1
  # PATCH/PUT /reward_recognitions/1.json

  def update
    @reward_recognition.update(reward_recognition_params)
    @reward_recognitions = RewardRecognition.all
    @reward_recognition = RewardRecognition.new
    redirect_to new_reward_recognition_path
  end

  # DELETE /reward_recognitions/1
  # DELETE /reward_recognitions/1.json
  

   def destroy
    @reward_recognition.destroy
    @reward_recognitions = RewardRecognition.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_recognition
      @reward_recognition = RewardRecognition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_recognition_params
      params.require(:reward_recognition).permit(:reward_type_id, :r_type, :reward_owner_id, :cost_unit, :communication)
    end
end