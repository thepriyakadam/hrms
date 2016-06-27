class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: [:show, :edit, :update, :destroy]

  # GET /training_plans
  # GET /training_plans.json
  def index
    @training_plans = TrainingPlan.all
    session[:active_tab] ="trainingmgmt"
  end

  # GET /training_plans/1
  # GET /training_plans/1.json
  def show
    @trainees = Trainee.where(training_plan_id: @training_plan.id)
  end

  # GET /training_plans/new
  def new
    @training_plan = TrainingPlan.new
    #@training_requests = TrainingRequest.all
    @employees = Employee.where(department_id: current_user.department_id)
    @training_request = TrainingRequest.find(params[:id])
    @training_plans = TrainingPlan.where(training_request_id: @training_request.id)
    session[:active_tab] ="trainingmgmt"
  end

  # GET /training_plans/1/edit
  def edit
  end

  # POST /training_plans
  # POST /training_plans.json
  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    # byebug
    respond_to do |format|
      if @training_plan.save
        @employee_ids = params[:employee_ids]
        @employee_ids.each do |eid|
        Trainee.create(employee_id: eid,training_plan_id: @training_plan.id)
      end
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

  def print_training_details
    @training_plan = TrainingPlan.find(params[:id])
    @trainees = Trainee.where(training_plan_id: @training_plan.id)
            respond_to do |f|
            f.js
            f.html
            f.pdf do
              render pdf: 'print_training_details',
              layout: 'pdf.html',
              :orientation      => 'Landscape', # default , Landscape,
              template: 'training_plans/print_training_details.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:13,bottom:13,left:13,right:13 }
            end
          end
  end

  def trainee_list
     @trainees = Trainee.all
     session[:active_tab] ="selfservice"
  end

  def modal_feedback
    @trainee = Trainee.find(params[:format])
  end

  def update_feedback
     @trainee = Trainee.find(params[:id])
     @feedback = params[:trainee][:feedback]
     @trainee.update(feedback: @feedback)
     flash[:notice] = 'Feedback Updated Successfully'
     redirect_to trainee_list_training_plans_path
  end

  def training_details_list
    # byebug
    @trainee = Trainee.find(params[:format])
    @training_plans = TrainingPlan.where(id: @trainee.training_plan_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_plan
      @training_plan = TrainingPlan.find(params[:id])
    end
    def trainee_params
      params.require(:trainee).permit(:training_plan_id,:employee_id,:feedback)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def training_plan_params
      params.require(:training_plan).permit(:training_date,:training_request_id, :training_topic_master_id, :topic, :no_of_employee, :trainer_name, :no_of_days, :no_of_hrs, :place)
    end
end
