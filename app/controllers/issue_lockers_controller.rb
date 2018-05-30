class IssueLockersController < ApplicationController
  before_action :set_issue_locker, only: [:show, :edit, :update, :destroy]

  # GET /issue_lockers
  # GET /issue_lockers.json
  def index
    @issue_lockers = IssueLocker.all
  end

  # GET /issue_lockers/1
  # GET /issue_lockers/1.json
  def show
  end

  # GET /issue_lockers/new
  def new
    @issue_locker = IssueLocker.new
  end

  # GET /issue_lockers/1/edit
  def edit
  end

  # POST /issue_lockers
  # POST /issue_lockers.json
  def create
    @issue_locker = IssueLocker.new(issue_locker_params)

    respond_to do |format|
      if @issue_locker.save
        format.html { redirect_to @issue_locker, notice: 'Issue locker was successfully created.' }
        format.json { render :show, status: :created, location: @issue_locker }
      else
        format.html { render :new }
        format.json { render json: @issue_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_lockers/1
  # PATCH/PUT /issue_lockers/1.json
  def update
    respond_to do |format|
      if @issue_locker.update(issue_locker_params)
        format.html { redirect_to @issue_locker, notice: 'Issue locker was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_locker }
      else
        format.html { render :edit }
        format.json { render json: @issue_locker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_lockers/1
  # DELETE /issue_lockers/1.json
  def destroy
    @issue_locker.destroy
    respond_to do |format|
      format.html { redirect_to issue_lockers_url, notice: 'Issue locker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_locker
      @issue_locker = IssueLocker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_locker_params
      params.require(:issue_locker).permit(:issue_request_id, :employee_id, :status,:lock_date,:lock_time)
    end
end
