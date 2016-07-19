class TrainingApprovalsController < ApplicationController
  before_action :set_training_approval, only: [:show, :edit, :update, :destroy]

  # GET /training_approvals
  # GET /training_approvals.json
  def index
    @training_approvals = TrainingApproval.all
  end

  # GET /training_approvals/1
  # GET /training_approvals/1.json
  def show
  end

  # GET /training_approvals/new
  def new
    @training_approval = TrainingApproval.new
  end

  # GET /training_approvals/1/edit
  def edit
  end

  # POST /training_approvals
  # POST /training_approvals.json
  def create
    @training_approval = TrainingApproval.new(training_approval_params)

    respond_to do |format|
      if @training_approval.save
        format.html { redirect_to @training_approval, notice: 'Training approval was successfully created.' }
        format.json { render :show, status: :created, location: @training_approval }
      else
        format.html { render :new }
        format.json { render json: @training_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_approvals/1
  # PATCH/PUT /training_approvals/1.json
  def update
    respond_to do |format|
      if @training_approval.update(training_approval_params)
        format.html { redirect_to @training_approval, notice: 'Training approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_approval }
      else
        format.html { render :edit }
        format.json { render json: @training_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_approvals/1
  # DELETE /training_approvals/1.json
  def destroy
    @training_approval.destroy
    respond_to do |format|
      format.html { redirect_to training_approvals_url, notice: 'Training approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_approval
      @training_approval = TrainingApproval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_approval_params
      params.require(:training_approval).permit(:training_request_id, :employee_id, :training_topic_master_id, :reporting_master_id, :traininig_period, :training_date, :place, :no_of_employee, :description, :justification)
    end
end
