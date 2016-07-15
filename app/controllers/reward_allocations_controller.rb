class RewardAllocationsController < ApplicationController
  before_action :set_reward_allocation, only: [:show, :edit, :update, :destroy]

  # GET /reward_allocations
  # GET /reward_allocations.json
  def index
    @reward_allocations = RewardAllocation.all
  end

  # GET /reward_allocations/1
  # GET /reward_allocations/1.json
  def show
  end

  # GET /reward_allocations/new
  def new
    @reward_allocation = RewardAllocation.new
  end

  # GET /reward_allocations/1/edit
  def edit
  end

  # POST /reward_allocations
  # POST /reward_allocations.json
  def create
    @reward_allocation = RewardAllocation.new(reward_allocation_params)

    respond_to do |format|
      if @reward_allocation.save
        format.html { redirect_to @reward_allocation, notice: 'Reward allocation was successfully created.' }
        format.json { render :show, status: :created, location: @reward_allocation }
      else
        format.html { render :new }
        format.json { render json: @reward_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_allocations/1
  # PATCH/PUT /reward_allocations/1.json
  def update
    respond_to do |format|
      if @reward_allocation.update(reward_allocation_params)
        format.html { redirect_to @reward_allocation, notice: 'Reward allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_allocation }
      else
        format.html { render :edit }
        format.json { render json: @reward_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_allocations/1
  # DELETE /reward_allocations/1.json
  def destroy
    @reward_allocation.destroy
    respond_to do |format|
      format.html { redirect_to reward_allocations_url, notice: 'Reward allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_allocation
      @reward_allocation = RewardAllocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_allocation_params
      params.require(:reward_allocation).permit(:code, :name, :description, :status)
    end
end
