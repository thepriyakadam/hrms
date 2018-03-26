class LateMarkMastersController < ApplicationController
  before_action :set_late_mark_master, only: [:show, :edit, :update, :destroy]

  # GET /late_mark_masters
  # GET /late_mark_masters.json
  def index
    @late_mark_masters = LateMarkMaster.all
  end

  # GET /late_mark_masters/1
  # GET /late_mark_masters/1.json
  def show
  end

  # GET /late_mark_masters/new
  def new
    @late_mark_master = LateMarkMaster.new
    @late_mark_masters = LateMarkMaster.all
  end

  # GET /late_mark_masters/1/edit
  def edit
  end

  # POST /late_mark_masters
  # POST /late_mark_masters.json

  def create
    @late_mark_master = LateMarkMaster.new(late_mark_master_params)
      if @late_mark_master.save
         @late_mark_master = LateMarkMaster.new
         @late_mark_masters = LateMarkMaster.all
         @flag=true 
      else
         @flag=false
      end
  end

  # PATCH/PUT /late_mark_masters/1
  # PATCH/PUT /late_mark_masters/1.json
  def update
    @late_mark_master.update(late_mark_master_params)
    @late_mark_master = LateMarkMaster.new
    @late_mark_masters = LateMarkMaster.all
  end

  # DELETE /late_mark_masters/1
  # DELETE /late_mark_masters/1.json
  def destroy
    @late_mark_master.destroy
    @late_mark_masters = LateMarkMaster.all
  end

  def is_confirm
    @late_mark_master = LateMarkMaster.find(params[:late_mark_master])
    LateMarkMaster.find(@late_mark_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_late_mark_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_late_mark_master
      @late_mark_master = LateMarkMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def late_mark_master_params
      params.require(:late_mark_master).permit(:from, :to, :late_mark, :is_active, :is_confirm)
    end
end
