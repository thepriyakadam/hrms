class RewardsPalsController < ApplicationController
  before_action :set_rewards_pal, only: [:show, :edit, :update, :destroy]

  # GET /rewards_pals
  # GET /rewards_pals.json
  def index
    @rewards_pals = RewardsPal.all
     
  end

  # GET /rewards_pals/1
  # GET /rewards_pals/1.json
  def show
  end

  # GET /rewards_pals/new

  def new
    @rewards_pal = RewardsPal.new
    @rewards_pals = RewardsPal.all
    session[:active_tab] = "performancemgmt"
    session[:active_tab1] = "reward"
  end

  # GET /rewards_pals/1/edit
  def edit
  end

  # POST /rewards_pals
  # POST /rewards_pals.json


  def create
    @rewards_pal = RewardsPal.new(rewards_pal_params)
    @rewards_pals = RewardsPal.all
    respond_to do |format|
      if @rewards_pal.save
        @rewards_pal = RewardsPal.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Rewards Pal Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /rewards_pals/1
  # PATCH/PUT /rewards_pals/1.json
  def update
    rewards_pal.update(rewards_pal_params)
    @rewards_pals = RewardsPal.all
    @rewards_pal = RewardsPal.new
  end

  # DELETE /rewards_pals/1
  # DELETE /rewards_pals/1.json
  def destroy
    @rewards_pal.destroy
    respond_to do |format|
      format.html { redirect_to rewards_pals_url, notice: 'Rewards pal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @rewards_pal.destroy
    @rewards_pals = RewardsPal.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rewards_pal
      @rewards_pal = RewardsPal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rewards_pal_params
      params.require(:rewards_pal).permit(:employee_id, :date, :purpose, :reward_type_id, :qty, :reporting_master_id)
    end
end
