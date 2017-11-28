class BonusMastersController < ApplicationController
  before_action :set_bonus_master, only: [:show, :edit, :update, :destroy]

  # GET /bonus_masters/new
  def new
    @bonus_master = BonusMaster.new
    @bonus_masters = BonusMaster.all
    session[:active_tab] ="master"
    session[:active_tab1] ="payrollcomponents"
  end

  # GET /bonus_masters/1/edit
  def edit
  end

  # POST /bonus_masters
  # POST /bonus_masters.json
#   def create
#     @bonus_master = BonusMaster.new(bonus_master_params)
#     @bonus_masters = BonusMaster.all
#       if @bonus_master.save
#         @bonus_master = BonusMaster.new
#       else
#         flash.now[:alert] = 'Bonus Master Already Exist.'
#         redirect_to new_bonus_master_path
#   end
# end

def create
    @bonus_master = BonusMaster.new(bonus_master_params)
    @bonus_masters = BonusMaster.all
    respond_to do |format|
      if @bonus_master.save
        @bonus_master = BonusMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Bonus Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end
  # PATCH/PUT /bonus_masters/1
  # PATCH/PUT /bonus_masters/1.json
  
  # def update
  #   @bonus_master.update(bonus_master_params)
  #   @bonus_masters = BonusMaster.all
  #   @bonus_master = BonusMaster.new
  #   redirect_to new_bonus_master_path

  # end

  def update
    @bonus_master.update(bonus_master_params)
    @bonus_masters = BonusMaster.all
    @bonus_master = BonusMaster.new
  end

  # DELETE /bonus_masters/1
  # DELETE /bonus_masters/1.json
  def destroy
    @bonus_master.destroy
    @bonus_masters = BonusMaster.all
  end

  def is_confirm
    @bonus_master = BonusMaster.find(params[:bonus_master])
    BonusMaster.find(@bonus_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_bonus_master_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bonus_master
    @bonus_master = BonusMaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bonus_master_params
    params.require(:bonus_master).permit(:is_confirm,:is_bouns, :limit_amount, :bonus_persentage, :status)
  end
end
