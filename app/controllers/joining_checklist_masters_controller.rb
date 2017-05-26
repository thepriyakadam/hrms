class JoiningChecklistMastersController < ApplicationController
  before_action :set_joining_checklist_master, only: [:show, :edit, :update, :destroy]

  # GET /joining_checklist_masters
  # GET /joining_checklist_masters.json
  def index
    @joining_checklist_master = JoiningChecklistMaster.new
    @joining_checklist_masters = JoiningChecklistMaster.all
  end

  # GET /joining_checklist_masters/1
  # GET /joining_checklist_masters/1.json
  def show
  end

  # GET /joining_checklist_masters/new
  def new
    @joining_checklist_master = JoiningChecklistMaster.new
    @joining_checklist_masters = JoiningChecklistMaster.all
    session[:active_tab] = "GlobalSetup"
     session[:active_tab1] = "OnBording"
  end

  # GET /joining_checklist_masters/1/edit
  def edit
  end

  # POST /joining_checklist_masters
  # POST /joining_checklist_masters.json
  def create
   @joining_checklist_master = JoiningChecklistMaster.new(joining_checklist_master_params)
    @joining_checklist_masters = JoiningChecklistMaster.all
    respond_to do |format|
      if @joining_checklist_master.save
         @joining_checklist_master = JoiningChecklistMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Joining Checklist Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /joining_checklist_masters/1
  # PATCH/PUT /joining_checklist_masters/1.json
  def update
    @joining_checklist_master.update(joining_checklist_master_params)
     @joining_checklist_masters = JoiningChecklistMaster.all
    @joining_checklist_master = JoiningChecklistMaster.new
   
        
  end

  # DELETE /joining_checklist_masters/1
  # DELETE /joining_checklist_masters/1.json
  def destroy
    @joining_checklist_master.destroy
    @joining_checklist_masters = JoiningChecklistMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joining_checklist_master
      @joining_checklist_master = JoiningChecklistMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joining_checklist_master_params
      params.require(:joining_checklist_master).permit(:code, :name, :description, :status)
    end
end
