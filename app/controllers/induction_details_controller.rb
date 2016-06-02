class InductionDetailsController < ApplicationController
  before_action :set_induction_detail, only: [:show, :edit, :update, :destroy]

  # GET /induction_details
  # GET /induction_details.json
  def index
    @induction_details = InductionDetail.all
  end

  # GET /induction_details/1
  # GET /induction_details/1.json
  def show
    @induction_activities = InductionActivity.where(induction_master_id: @induction_detail.induction_master_id)
  end

  # GET /induction_details/new
  def new
    @induction_detail = InductionDetail.new
    @induction_details = InductionDetail.all
  end

  # GET /induction_details/1/edit
  def edit
  end

  # POST /induction_details
  # POST /induction_details.json
 
  def create
    @induction_detail = InductionDetail.new(induction_detail_params)
    @induction_details = InductionDetail.all
    respond_to do |format|
        if @induction_detail.save
         @induction_detail = InductionDetail.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Induction Detail Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /induction_details/1
  # PATCH/PUT /induction_details/1.json
  def update
    respond_to do |format|
      if @induction_detail.update(induction_detail_params)
        format.html { redirect_to @induction_detail, notice: 'Induction detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @induction_detail }
      else
        format.html { render :edit }
        format.json { render json: @induction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    @induction_detail.update(induction_detail_params)
    @induction_details = InductionDetail.all
    @induction_detail = InductionDetail.new
  end

  def destroy
    @induction_detail.destroy
    @induction_details = InductionDetail.all
  end

  def all_induction_detail_list
   @induction_details = InductionDetail.all
   session[:active_tab] ="induction"
  end

  def confirm
    @induction_detail = InductionDetail.find(params[:format])
    @induction_detail.update(induction_completed: true)
    redirect_to all_induction_detail_list_induction_details_path
    flash[:notice] = 'induction Confirmed Successfully'
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_detail
      @induction_detail = InductionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_detail_params
      params.require(:induction_detail).permit(:employee_id, :start_date, :induction_master_id, :induction_completed)
    end
end
