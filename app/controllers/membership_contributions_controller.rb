class MembershipContributionsController < ApplicationController
  before_action :set_membership_contribution, only: [:show, :edit, :update, :destroy]

  # GET /membership_contributions
  # GET /membership_contributions.json
  def index
    @membership_contributions = MembershipContribution.all
  end

  # GET /membership_contributions/1
  # GET /membership_contributions/1.json
  def show
  end

  # GET /membership_contributions/new
  def new
    @membership_contribution = MembershipContribution.new
  end

  # GET /membership_contributions/1/edit
  def edit
  end

  # POST /membership_contributions
  # POST /membership_contributions.json
  def create
    # byebug
    @membership_contribution = MembershipContribution.new(membership_contribution_params)
    @membership = MembershipBalance.find_by(params[:membership_id])
    respond_to do |format|
      if @membership_contribution.save
        @a = MembershipContribution.all.last
        # @balance = MembershipBalance.find(params)
        @amount1 = @membership.balance + @a.amount
        @b = MembershipBalance.where(membership_id: @a.membership_id).update_all(balance: @amount1)
        format.html { redirect_to @membership_contribution, notice: 'Membership contribution was successfully created.' }
        format.json { render :show, status: :created, location: @membership_contribution }
      else
        format.html { render :new }
        format.json { render json: @membership_contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_contributions/1
  # PATCH/PUT /membership_contributions/1.json
  def update
    respond_to do |format|
      if @membership_contribution.update(membership_contribution_params)
        format.html { redirect_to @membership_contribution, notice: 'Membership contribution was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership_contribution }
      else
        format.html { render :edit }
        format.json { render json: @membership_contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_contributions/1
  # DELETE /membership_contributions/1.json
  def destroy
    @membership_contribution.destroy
    respond_to do |format|
      format.html { redirect_to membership_contributions_url, notice: 'Membership contribution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_contribution
      @membership_contribution = MembershipContribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_contribution_params
      params.require(:membership_contribution).permit(:membership_id, :date, :amount)
    end
end
