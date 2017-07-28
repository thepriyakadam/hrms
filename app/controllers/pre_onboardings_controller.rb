class PreOnboardingsController < ApplicationController
  before_action :set_pre_onboarding, only: [:show, :edit, :update, :destroy]

  # GET /pre_onboardings
  # GET /pre_onboardings.json
  def index
    @pre_onboardings = PreOnboarding.all
  end

  # GET /pre_onboardings/1
  # GET /pre_onboardings/1.json
  def show
  end

  # GET /pre_onboardings/new
  def new
    @pre_onboarding = PreOnboarding.new
  end

  # GET /pre_onboardings/1/edit
  def edit
  end

  # POST /pre_onboardings
  # POST /pre_onboardings.json
  def create
    @pre_onboarding = PreOnboarding.new(pre_onboarding_params)

    respond_to do |format|
      if @pre_onboarding.save
        format.html { redirect_to @pre_onboarding, notice: 'Pre onboarding was successfully created.' }
        format.json { render :show, status: :created, location: @pre_onboarding }
      else
        format.html { render :new }
        format.json { render json: @pre_onboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_onboardings/1
  # PATCH/PUT /pre_onboardings/1.json
  def update
    respond_to do |format|
      if @pre_onboarding.update(pre_onboarding_params)
        format.html { redirect_to @pre_onboarding, notice: 'Pre onboarding was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_onboarding }
      else
        format.html { render :edit }
        format.json { render json: @pre_onboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_onboardings/1
  # DELETE /pre_onboardings/1.json
  def destroy
    @pre_onboarding.destroy
    respond_to do |format|
      format.html { redirect_to pre_onboardings_url, notice: 'Pre onboarding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_onboarding
      @pre_onboarding = PreOnboarding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_onboarding_params
      params.require(:pre_onboarding).permit(:selected_resume_id, :first_name, :middle_name, :last_name, :birth_date, :gender, :marital_status, :fathers_name, :nationality, :permanent_address, :city, :country_id, :state_id, :district_id, :pin_code, :current_address, :contact_no, :optional_no, :email, :pan_no, :adhar_no)
    end
end
