class EsicMastersController < ApplicationController
  before_action :set_esic_master, only: [:show, :edit, :update, :destroy]
  
  def new
    @esic_master = EsicMaster.new
    @esic_masters = EsicMaster.all
  end

  # GET /esic_masters/1/edit
  def edit
  end

  # POST /esic_masters
  # POST /esic_masters.json
  def create
    components = params[:components]
    str = String.new
    i = 0
    components.each do |c|
      if i == 0
        str = c.to_s
      else
        str = str.to_s+","+c.to_s
      end
      i = i + 1
    end
    @esic_master = EsicMaster.new(esic_master_params)
    @esic_master.base_component = str
    @esic_masters = EsicMaster.all
    @esic_master.save
    @esic_master = EsicMaster.new
  end
  # PATCH/PUT /esic_masters/1
  # PATCH/PUT /esic_masters/1.json
  def update
        @esic_master.update(esic_master_params)
        @esic_masters = EsicMaster.all
        @esic_master = EsicMaster.new
  end

  # DELETE /esic_masters/1
  # DELETE /esic_masters/1.json
  def destroy
    @esic_master.destroy
    @esic_masters = EsicMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esic_master
      @esic_master = EsicMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def esic_master_params
      params.require(:esic_master).permit(:esic, :percentage, :date_effective, :max_limit, :base_component)
    end
end
