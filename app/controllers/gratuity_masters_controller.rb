class GratuityMastersController < ApplicationController
  before_action :set_gratuity_master, only: [:show, :edit, :update, :destroy]

  # GET /gratuity_masters
  # GET /gratuity_masters.json
  def index
    @gratuity_masters = GratuityMaster.all
  end

  # GET /gratuity_masters/1
  # GET /gratuity_masters/1.json
  def show
  end

  # GET /gratuity_masters/new
  def new
    @gratuity_master = GratuityMaster.new
    @gratuity_masters = GratuityMaster.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /gratuity_masters/1/edit
  def edit
  end

  # POST /gratuity_masters
  # POST /gratuity_masters.json
  def create
    @gratuity_master = GratuityMaster.new(gratuity_master_params)
    @gratuity_masters = GratuityMaster.all

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
    @gratuity_master.base_component = str


    respond_to do |format|
      if @gratuity_master.save
        @gratuity_master = GratuityMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Gratuity Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /gratuity_masters/1
  # PATCH/PUT /gratuity_masters/1.json
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
    @gratuity_master.base_component = str
    @gratuity_master.update(gratuity_master_params)
    @gratuity_master = GratuityMaster.new
    @gratuity_masters = GratuityMaster.all
  end

  def gratuity_master_modal
    @gratuity_master = GratuityMaster.find(params[:format])
  end

  # DELETE /gratuity_masters/1
  # DELETE /gratuity_masters/1.json
  def destroy
    @gratuity_master.destroy
    @gratuity_masters = GratuityMaster.all
  end

  def is_confirm
    @gratuity_master = GratuityMaster.find(params[:gratuity_master])
    GratuityMaster.find(@gratuity_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_gratuity_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gratuity_master
      @gratuity_master = GratuityMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gratuity_master_params
      params.require(:gratuity_master).permit(:no_of_year, :base_component, :day_in_month, :payable_day, :is_active, :is_confirm)
    end
end
