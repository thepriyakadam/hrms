class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: [:show, :edit, :update, :destroy]

  # GET /training_plans
  # GET /training_plans.json
  def index
    @training_plans = TrainingPlan.all
  end

  # GET /training_plans/1
  # GET /training_plans/1.json
  def show
  end

  # GET /training_plans/new
  def new
    @training_plan = TrainingPlan.new
    session[:active_tab] ="trainingmgmt"
  end

  # GET /training_plans/1/edit
  def edit
  end

  # POST /training_plans
  # POST /training_plans.json
  def create
    @training_plan = TrainingPlan.new(training_plan_params)

    respond_to do |format|
      if @training_plan.save
        format.html { redirect_to @training_plan, notice: 'Training plan was successfully created.' }
        format.json { render :show, status: :created, location: @training_plan }
      else
        format.html { render :new }
        format.json { render json: @training_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_plans/1
  # PATCH/PUT /training_plans/1.json
  def update
    respond_to do |format|
      if @training_plan.update(training_plan_params)
        format.html { redirect_to @training_plan, notice: 'Training plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_plan }
      else
        format.html { render :edit }
        format.json { render json: @training_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_plans/1
  # DELETE /training_plans/1.json
  def destroy
    @training_plan.destroy
    respond_to do |format|
      format.html { redirect_to training_plans_url, notice: 'Training plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_plan
      @training_plan = TrainingPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_plan_params
      params.require(:training_plan).permit(:training_date, :training_topic_master_id, :topic, :no_of_employee, :trainer_name, :no_of_days, :no_of_hrs, :place)
    end
end
