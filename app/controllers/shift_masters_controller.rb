class ShiftMastersController < ApplicationController
  before_action :set_shift_master, only: [:show, :edit, :update, :destroy]

  # GET /shift_masters
  # GET /shift_masters.json
  def index
    @shift_masters = ShiftMaster.all
  end

  # GET /shift_masters/1
  # GET /shift_masters/1.json
  def show
  end

  # GET /shift_masters/new
  def new
    @shift_master = ShiftMaster.new
    @shift_masters = ShiftMaster.all
  end

  # GET /shift_masters/1/edit
  def edit
  end

  # POST /shift_masters
  # POST /shift_masters.json
  def create
     @shift_master = ShiftMaster.new(shift_master_params)
      if @shift_master.save
         @shift_master = ShiftMaster.new
         @shift_masters = ShiftMaster.all
         @flag=true 
      else
         @flag=false
      end
  end

  # PATCH/PUT /shift_masters/1
  # PATCH/PUT /shift_masters/1.json
  def update
    @shift_master.update(shift_master_params)
    @shift_master = ShiftMaster.new
    @shift_masters = ShiftMaster.all
  end

  # DELETE /shift_masters/1
  # DELETE /shift_masters/1.json

  def destroy
    @shift_master.destroy
    @shift_masters = ShiftMaster.all
  end

  def is_confirm
    @shift_master = ShiftMaster.find(params[:shift_master])
    shift_master.find(@shift_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_shift_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_master
      @shift_master = ShiftMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_master_params
      params.require(:shift_master).permit(:code, :name, :description, :is_confirm, :is_active)
    end
end
