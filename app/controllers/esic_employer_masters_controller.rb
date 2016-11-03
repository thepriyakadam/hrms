class EsicEmployerMastersController < ApplicationController
  before_action :set_esic_employer_master, only: [:show, :edit, :update, :destroy]

  # GET /esic_employer_masters
  # GET /esic_employer_masters.json
  def index
  end

  # GET /esic_employer_masters/1
  # GET /esic_employer_masters/1.json
  def show
  end

  # GET /esic_employer_masters/new
  def new
    @esic_employer_master = EsicEmployerMaster.new
    @esic_employer_masters = EsicEmployerMaster.all

  end

  # GET /esic_employer_masters/1/edit
  def edit
  end

  # POST /esic_employer_masters
  # POST /esic_employer_masters.json
  def create
    @esic_employer_master = EsicEmployerMaster.new(esic_employer_master_params)
    @esic_employer_masters = EsicEmployerMaster.all

    respond_to do |format|
      if @esic_employer_master.save
        esic_employer_master = EsicEmployerMaster.new
     format.js { @flag = true }

      else
        flash.now[:alert] = 'ESIC Employer Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /esic_employer_masters/1
  # PATCH/PUT /esic_employer_masters/1.json
  def update
   @esic_employer_master.update(esic_employer_master_params)
   @esic_employer_master = EsicEmployerMaster.new
   @esic_employer_masters = EsicEmployerMaster.all    
  end

  # DELETE /esic_employer_masters/1
  # DELETE /esic_employer_masters/1.json
  def destroy
    @esic_employer_master.destroy
    @esic_employer_masters = EsicEmployerMaster.all    
  end

  def is_confirm
    @esic_employer_master = EsicEmployerMaster.find(params[:esic_employer_master])
    EsicEmployerMaster.find(@esic_employer_master.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_esic_employer_master_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esic_employer_master
      @esic_employer_master = EsicEmployerMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def esic_employer_master_params
      params.require(:esic_employer_master).permit(:esic, :percentage, :effective_from, :effective_to, :max_limit, :base_component, :is_active, :is_confirm)
    end
end
