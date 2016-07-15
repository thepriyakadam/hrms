class RewardOwnersController < ApplicationController
  before_action :set_reward_owner, only: [:show, :edit, :update, :destroy]

  # GET /reward_owners
  # GET /reward_owners.json
  def index
    @reward_owners = RewardOwner.all
  end

  # GET /reward_owners/1
  # GET /reward_owners/1.json
  def show
  end

  # GET /reward_owners/new
  def new
    @reward_owner = RewardOwner.new
  end

  # GET /reward_owners/1/edit
  def edit
  end

  # POST /reward_owners
  # POST /reward_owners.json
  def create
    @reward_owner = RewardOwner.new(reward_owner_params)

    respond_to do |format|
      if @reward_owner.save
        format.html { redirect_to @reward_owner, notice: 'Reward owner was successfully created.' }
        format.json { render :show, status: :created, location: @reward_owner }
      else
        format.html { render :new }
        format.json { render json: @reward_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_owners/1
  # PATCH/PUT /reward_owners/1.json
  def update
    respond_to do |format|
      if @reward_owner.update(reward_owner_params)
        format.html { redirect_to @reward_owner, notice: 'Reward owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_owner }
      else
        format.html { render :edit }
        format.json { render json: @reward_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_owners/1
  # DELETE /reward_owners/1.json
  def destroy
    @reward_owner.destroy
    respond_to do |format|
      format.html { redirect_to reward_owners_url, notice: 'Reward owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_owner
      @reward_owner = RewardOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_owner_params
      params.require(:reward_owner).permit(:code, :name, :description, :status)
    end
end
