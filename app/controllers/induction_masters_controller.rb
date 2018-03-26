class InductionMastersController < ApplicationController
  before_action :set_induction_master, only: [:show, :edit, :update, :destroy]

  # GET /induction_masters
  # GET /induction_masters.json
  def index
    @induction_masters = InductionMaster.all
  end

  # GET /induction_masters/1
  # GET /induction_masters/1.json
  def show
  end

  # GET /induction_masters/new
  def new
    @induction_master = InductionMaster.new
    @induction_masters = InductionMaster.all
    session[:active_tab] ="EmployeeManagement"
    session[:active_tab1] ="EmployeeInduction"
  end

  # GET /induction_masters/1/edit
  def edit
  end

  # POST /induction_masters
  # POST /induction_masters.json

  # def create
  #   @induction_master = InductionMaster.new(induction_master_params)
  #   @induction_masters = InductionMaster.all
  #   respond_to do |format|
  #      if @induction_master.save
  #        @induction_master = InductionMaster.new
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Induction Already Exist.'
  #       format.js { @flag = false }
  #     end
  #   end
  # end

  def create
     @induction_master = InductionMaster.new(induction_master_params)
     @induction_masters = InductionMaster.all
      if @induction_master.save
        @induction_master = InductionMaster.new
      end
      redirect_to new_induction_master_path
      flash[:notice] = 'Induction Template saved Successfully.'   
  end

  # def create
  #   @induction_master = InductionMaster.new(induction_master_params)
  #   @induction_masters = InductionMaster.all
  #   respond_to do |format|
  #     if @induction_master.save
  #       @induction_master = InductionMaster.new
  #       format.js { @flag = true }
  #     else
  #       flash.now[:alert] = 'Induction Master Already Exist'
  #       format.js { @flag = false }
  #     end
  #   end
  # end


  # PATCH/PUT /induction_masters/1
  # PATCH/PUT /induction_masters/1.json

  def update
    @induction_master.update(induction_master_params)
    @induction_masters = InductionMaster.all
    @induction_master = InductionMaster.new
    redirect_to new_induction_master_path
  end

  # DELETE /induction_masters/1
  # DELETE /induction_masters/1.json
 
  def destroy
    @induction_master.destroy
    @induction_masters = InductionMaster.all
  end

   def download_induction_document
    @induction_master = InductionMaster.find(params[:id])
    send_file @induction_master.avatar.path,
              filename: @induction_master.avatar_file_name,
              type: @induction_master.avatar_content_type,
              disposition: 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_master
      @induction_master = InductionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_master_params
      params.require(:induction_master).permit(:avatar, :code, :description)
    end
end
