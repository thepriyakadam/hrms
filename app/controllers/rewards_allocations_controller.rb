class RewardsAllocationsController < ApplicationController
  before_action :set_rewards_allocation, only: [:show, :edit, :update, :destroy]

  # GET /rewards_allocations
  # GET /rewards_allocations.json
  def index
    @rewards_allocations = RewardsAllocation.all
  end

  # GET /rewards_allocations/1
  # GET /rewards_allocations/1.json
  def show
  end

  # GET /rewards_allocations/new
  def new
    @rewards_allocation = RewardsAllocation.new
  end

  # GET /rewards_allocations/1/edit
  def edit
  end

  # POST /rewards_allocations
  # POST /rewards_allocations.json
  def create
    @rewards_allocation = RewardsAllocation.new(rewards_allocation_params)

    respond_to do |format|
      if @rewards_allocation.save
        format.html { redirect_to @rewards_allocation, notice: 'Rewards allocation was successfully created.' }
        format.json { render :show, status: :created, location: @rewards_allocation }
      else
        format.html { render :new }
        format.json { render json: @rewards_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards_allocations/1
  # PATCH/PUT /rewards_allocations/1.json
  def update
    respond_to do |format|
      if @rewards_allocation.update(rewards_allocation_params)
        format.html { redirect_to @rewards_allocation, notice: 'Rewards allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @rewards_allocation }
      else
        format.html { render :edit }
        format.json { render json: @rewards_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards_allocations/1
  # DELETE /rewards_allocations/1.json
  def destroy
    @rewards_allocation.destroy
    respond_to do |format|
      format.html { redirect_to rewards_allocations_url, notice: 'Rewards allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rewards_allocation
      @rewards_allocation = RewardsAllocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rewards_allocation_params
      params.require(:rewards_allocation).permit(:reward_type_id, :department_id, :reporting_master_id, :from, :to, :allocated_qty, :cost)
    end
end
