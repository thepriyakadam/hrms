class RelationMastersController < ApplicationController
  before_action :set_relation_master, only: [:show, :edit, :update, :destroy]

  # GET /relation_masters
  # GET /relation_masters.json
  def index
    @relation_masters = RelationMaster.all
  end

  # GET /relation_masters/1
  # GET /relation_masters/1.json
  def show
  end

  # GET /relation_masters/new
  def new
    @relation_master = RelationMaster.new
    @relation_masters = RelationMaster.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /relation_masters/1/edit
  def edit
  end

  # POST /relation_masters
  # POST /relation_masters.json
  def create
    @relation_master = RelationMaster.new(relation_master_params)

      if @relation_master.save
        @flag = true
        @relation_master = RelationMaster.new
        @relation_masters = RelationMaster.all
      else
         @flag = false
      end
  end

  # PATCH/PUT /relation_masters/1
  # PATCH/PUT /relation_masters/1.json
  def update
      if @relation_master.update(relation_master_params)
        @flag = true
        @relation_master = RelationMaster.new
        @relation_masters = RelationMaster.all
      else
        @flag = false
      end
  end

  # DELETE /relation_masters/1
  # DELETE /relation_masters/1.json
  def destroy
    @relation_master.destroy
    @relation_masters = RelationMaster.all
    redirect_to new_relation_master_path
  end

  def is_confirm
    @relation_master = RelationMaster.find(params[:relation_master])
    RelationMaster.find(@relation_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_relation_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation_master
      @relation_master = RelationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_master_params
      params.require(:relation_master).permit(:is_confirm,:code, :name, :description)
    end
end
