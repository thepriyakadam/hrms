class COffCashMastersController < ApplicationController
  before_action :set_c_off_cash_master, only: [:show, :edit, :update, :destroy]

  # GET /c_off_cash_masters
  # GET /c_off_cash_masters.json
  def index
    @c_off_cash_masters = COffCashMaster.all
  end

  # GET /c_off_cash_masters/1
  # GET /c_off_cash_masters/1.json
  def show
  end

  # GET /c_off_cash_masters/new
  def new
    @c_off_cash_master = COffCashMaster.new
    @c_off_cash_masters = COffCashMaster.all
  end

  # GET /c_off_cash_masters/1/edit
  def edit
  end

  # POST /c_off_cash_masters
  # POST /c_off_cash_masters.json
  def create
    components = params[:components]
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @c_off_cash_master = COffCashMaster.new(c_off_cash_master_params)
    @c_off_cash_master.base_component = str
    @c_off_cash_masters = COffCashMaster.all
    @c_off_cash_master.save
    @c_off_cash_master = COffCashMaster.new
  end

  # PATCH/PUT /c_off_cash_masters/1
  # PATCH/PUT /c_off_cash_masters/1.json
  def update
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @c_off_cash_master.base_component = str
    @c_off_cash_master.update(c_off_cash_master_params)
    @c_off_cash_masters = COffCashMaster.all
    @c_off_cash_master = COffCashMaster.new
  end

  # DELETE /c_off_cash_masters/1
  # DELETE /c_off_cash_masters/1.json
  def destroy
    @c_off_cash_master.destroy
    @c_off_cash_masters = COffCashMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_off_cash_master
      @c_off_cash_master = COffCashMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_off_cash_master_params
      params.require(:c_off_cash_master).permit(:base_component, :rate, :is_active)
    end
end
