class ProjectMastersController < ApplicationController
  before_action :set_project_master, only: [:show, :edit, :update, :destroy]

  # GET /project_masters
  # GET /project_masters.json
  def index
    @project_masters = ProjectMaster.all
     session[:active_tab] ="ProjectMaster"
  end

  # GET /project_masters/1
  # GET /project_masters/1.json
  def show
  end

  # GET /project_masters/new
  def new
    @project_master = ProjectMaster.new
    @project_masters = ProjectMaster.all
    session[:active_tab] = "GlobalSetup"
  end

  # GET /project_masters/1/edit
  def edit
  end

  # POST /project_masters
  # POST /project_masters.json
  def create
     @project_master = ProjectMaster.new(project_master_params)
    @project_masters = ProjectMaster.all
    respond_to do |format|
      if @project_master.save
         @project_master = ProjectMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Project Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /project_masters/1
  # PATCH/PUT /project_masters/1.json
  def update
    @project_master.update(project_master_params)
    @project_masters = ProjectMaster.all
    @project_master = ProjectMaster.new
  end

  # DELETE /project_masters/1
  # DELETE /project_masters/1.json
  def destroy
    @project_master.destroy
    @project_masters = ProjectMaster.all
  end

  def is_confirm
    @project_master = ProjectMaster.find(params[:project_master])
    ProjectMaster.find(@project_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_project_master_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_master
      @project_master = ProjectMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_master_params
      params.require(:project_master).permit(:is_confirm,:code, :name, :description)
    end
end
