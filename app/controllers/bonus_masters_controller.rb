class BonusMastersController < ApplicationController
  before_action :set_bonus_master, only: [:show, :edit, :update, :destroy]

  # GET /bonus_masters
  # GET /bonus_masters.json
  def index
    @bonus_masters = BonusMaster.all
  end

  # GET /bonus_masters/1
  # GET /bonus_masters/1.json
  def show
  end

  # GET /bonus_masters/new
  def new
    @bonus_master = BonusMaster.new
  end

  # GET /bonus_masters/1/edit
  def edit
  end

  # POST /bonus_masters
  # POST /bonus_masters.json
  def create
    @bonus_master = BonusMaster.new(bonus_master_params)

    respond_to do |format|
      if @bonus_master.save
        format.html { redirect_to @bonus_master, notice: 'Bonus master was successfully created.' }
        format.json { render :show, status: :created, location: @bonus_master }
      else
        format.html { render :new }
        format.json { render json: @bonus_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonus_masters/1
  # PATCH/PUT /bonus_masters/1.json
  def update
    respond_to do |format|
      if @bonus_master.update(bonus_master_params)
        format.html { redirect_to @bonus_master, notice: 'Bonus master was successfully updated.' }
        format.json { render :show, status: :ok, location: @bonus_master }
      else
        format.html { render :edit }
        format.json { render json: @bonus_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonus_masters/1
  # DELETE /bonus_masters/1.json
  def destroy
    @bonus_master.destroy
    respond_to do |format|
      format.html { redirect_to bonus_masters_url, notice: 'Bonus master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonus_master
      @bonus_master = BonusMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bonus_master_params
      params.require(:bonus_master).permit(:is_bouns, :limit_amount, :bonus_persentage, :status)
    end
end
