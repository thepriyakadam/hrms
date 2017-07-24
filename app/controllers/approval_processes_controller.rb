class ApprovalProcessesController < ApplicationController
  before_action :set_approval_process, only: [:show, :edit, :update, :destroy]

  # GET /approval_processes
  # GET /approval_processes.json
  def index
    @approval_process = ApprovalProcess.new
    @approval_processes = ApprovalProcess.all
  end

  # GET /approval_processes/1
  # GET /approval_processes/1.json
  def show
  end

  # GET /approval_processes/new
  def new
    @approval_process = ApprovalProcess.new
    @approval_processes = ApprovalProcess.all
  end

  # GET /approval_processes/1/edit
  def edit
  end

  # POST /approval_processes
  # POST /approval_processes.json
  def create
    @approval_process = ApprovalProcess.new(approval_process_params)
    @approval_processes = ApprovalProcess.all
    respond_to do |format|
      if @approval_process.save
         @approval_process = ApprovalProcess.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Approval Process Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /approval_processes/1
  # PATCH/PUT /approval_processes/1.json
  def update
    @approval_process.update(approval_process_params)
    @approval_processes = ApprovalProcess.all
    @approval_process = ApprovalProcess.new
  end

  # DELETE /approval_processes/1
  # DELETE /approval_processes/1.json
  def destroy
    @approval_process.destroy
    @approval_processes = ApprovalProcess.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval_process
      @approval_process = ApprovalProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_process_params
      params.require(:approval_process).permit(:membership_id, :from, :to, :status)
    end
end
