class IssueMastersController < ApplicationController
  before_action :set_issue_master, only: [:show, :edit, :update, :destroy]

  # GET /issue_masters
  # GET /issue_masters.json
  def index
    @issue_masters = IssueMaster.all
  end

  # GET /issue_masters/1
  # GET /issue_masters/1.json
  def show
  end

  # GET /issue_masters/new
  def new
    @issue_master = IssueMaster.new
  end

  # GET /issue_masters/1/edit
  def edit
  end

  # POST /issue_masters
  # POST /issue_masters.json
  def create
    @issue_master = IssueMaster.new(issue_master_params)

    respond_to do |format|
      if @issue_master.save
        format.html { redirect_to @issue_master, notice: 'Issue master was successfully created.' }
        format.json { render :show, status: :created, location: @issue_master }
      else
        format.html { render :new }
        format.json { render json: @issue_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_masters/1
  # PATCH/PUT /issue_masters/1.json
  def update
    respond_to do |format|
      if @issue_master.update(issue_master_params)
        format.html { redirect_to @issue_master, notice: 'Issue master was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_master }
      else
        format.html { render :edit }
        format.json { render json: @issue_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_masters/1
  # DELETE /issue_masters/1.json
  def destroy
    @issue_master.destroy
    respond_to do |format|
      format.html { redirect_to issue_masters_url, notice: 'Issue master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_master
      @issue_master = IssueMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_master_params
      params.require(:issue_master).permit(:issue_tracker_group_id, :issue_type_id, :name, :description, :status, :is_confirm)
    end
end
