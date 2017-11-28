class RewardOwnersController < ApplicationController
  before_action :set_reward_owner, only: [:show, :edit, :update, :destroy]

  # GET /reward_owners/new
  def new
    @reward_owner = RewardOwner.new
    @reward_owners = RewardOwner.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Rewards"
  end

  # GET /reward_owners/1/edit
  def edit
  end

  # POST /reward_owners
  # POST /reward_owners.json
  def create
    @reward_owner = RewardOwner.new(reward_owner_params)
    @reward_owners = RewardOwner.all

    respond_to do |format|
      if @reward_owner.save
        @reward_owner = RewardOwner.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reward Owner Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reward_owners/1
  # PATCH/PUT /reward_owners/1.json
  def update
    @reward_owner.update(reward_owner_params)
    @reward_owner = RewardOwner.new
    @reward_owners = RewardOwner.all
  end

  # DELETE /reward_owners/1
  # DELETE /reward_owners/1.json
  def destroy
    @reward_owner.destroy
    @reward_owners = RewardOwner.all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_owner
      @reward_owner = RewardOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_owner_params
      params.require(:reward_owner).permit(:is_confirm,:code, :name, :description, :status)
    end
end
