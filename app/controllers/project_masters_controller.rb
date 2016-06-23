class ProjectMastersController < ApplicationController
  before_action :set_project_master, only: [:show, :edit, :update, :destroy]

  # GET /project_masters
  # GET /project_masters.json
  def index
    @project_masters = ProjectMaster.all
  end

  # GET /project_masters/1
  # GET /project_masters/1.json
  def show
  end

  # GET /project_masters/new
  def new
    @project_master = ProjectMaster.new
  end

  # GET /project_masters/1/edit
  def edit
  end

  # POST /project_masters
  # POST /project_masters.json
  def create
    @project_master = ProjectMaster.new(project_master_params)

    respond_to do |format|
      if @project_master.save
        format.html { redirect_to @project_master, notice: 'Project master was successfully created.' }
        format.json { render :show, status: :created, location: @project_master }
      else
        format.html { render :new }
        format.json { render json: @project_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_masters/1
  # PATCH/PUT /project_masters/1.json
  def update
    respond_to do |format|
      if @project_master.update(project_master_params)
        format.html { redirect_to @project_master, notice: 'Project master was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_master }
      else
        format.html { render :edit }
        format.json { render json: @project_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_masters/1
  # DELETE /project_masters/1.json
  def destroy
    @project_master.destroy
    respond_to do |format|
      format.html { redirect_to project_masters_url, notice: 'Project master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_master
      @project_master = ProjectMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_master_params
      params.require(:project_master).permit(:code, :name, :description)
    end
end
