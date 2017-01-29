class RewardTypesController < ApplicationController
  before_action :set_reward_type, only: [:show, :edit, :update, :destroy]

  # GET /reward_types
  # GET /reward_types.json
  def index
    @reward_types = RewardType.all
  end

  # GET /reward_types/1
  # GET /reward_types/1.json
  def show
  end

  # GET /reward_types/new
  
  def new
    @reward_type = RewardType.new
    @reward_types = RewardType.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Rewards"
  end

  # GET /reward_types/1/edit
  def edit
  end

  # POST /reward_types
  # POST /reward_types.json


  def create
    @reward_type = RewardType.new(reward_type_params)
    @reward_types = RewardType.all
    respond_to do |format|
      if @reward_type.save
        @reward_type = RewardType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reward Type was Successfully created.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reward_types/1
  # PATCH/PUT /reward_types/1.json

  def update
    @reward_type.update(reward_type_params)
    @reward_types = RewardType.all
    @reward_type = RewardType.new
  end

  # DELETE /reward_types/1
  # DELETE /reward_types/1.json

  def destroy
    @reward_type.destroy
    @reward_types = RewardType.all
  end

  def is_confirm
    @reward_type = RewardType.find(params[:reward_type])
    RewardType.find(@reward_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_reward_type_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_type
      @reward_type = RewardType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_type_params
      params.require(:reward_type).permit(:is_confirm,:code, :name, :description, :status)
    end
end
