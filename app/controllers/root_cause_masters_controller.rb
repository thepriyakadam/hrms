class RootCauseMastersController < ApplicationController
  before_action :set_root_cause_master, only: [:show, :edit, :update, :destroy]

  # GET /root_cause_masters
  # GET /root_cause_masters.json
  def index
    @root_cause_masters = RootCauseMaster.all
  end

  # GET /root_cause_masters/1
  # GET /root_cause_masters/1.json
  def show
  end

  # GET /root_cause_masters/new
  def new
    @root_cause_master = RootCauseMaster.new
    @root_cause_masters = RootCauseMaster.all
    session[:active_tab] = "master"
    session[:active_tab1] = "accident"
  end

  # GET /root_cause_masters/1/edit
  def edit
  end

  # POST /root_cause_masters
  # POST /root_cause_masters.json
  def create
    @root_cause_master = RootCauseMaster.new(root_cause_master_params)
    @root_cause_masters = RootCauseMaster.all
    respond_to do |format|
      if @root_cause_master.save
        @root_cause_master = RootCauseMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Root Cause Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # def create
  #   @root_cause_master = RootCauseMaster.new(interview_evalution_params)
  #   @root_cause_masters = RootCauseMaster.all
  #   respond_to do |format|
  #     if @interview_evalution.save
  #        @interview_evalution = InterviewEvalution.new
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Interview Already Exist.'
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  # PATCH/PUT /root_cause_masters/1
  # PATCH/PUT /root_cause_masters/1.json
  # def update
  #   respond_to do |format|
  #     if @root_cause_master.update(root_cause_master_params)
  #       format.html { redirect_to @root_cause_master, notice: 'Root cause master was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @root_cause_master }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @root_cause_master.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

   def update
    @root_cause_master.update(root_cause_master_params)
    @root_cause_masters = RootCauseMaster.all
    @root_cause_master = RootCauseMaster.new
  end

  # DELETE /root_cause_masters/1
  # DELETE /root_cause_masters/1.json
  # def destroy
  #   @root_cause_master.destroy
  #   respond_to do |format|
  #     format.html { redirect_to root_cause_masters_url, notice: 'Root cause master was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

   def destroy
    @root_cause_master.destroy
    @root_cause_masters = RootCauseMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_cause_master
      @root_cause_master = RootCauseMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def root_cause_master_params
      params.require(:root_cause_master).permit(:code, :name, :description)
    end
end
