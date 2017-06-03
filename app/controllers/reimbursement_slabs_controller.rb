class ReimbursementSlabsController < ApplicationController
  before_action :set_reimbursement_slab, only: [:show, :edit, :update, :destroy]

  # GET /reimbursement_slabs
  # GET /reimbursement_slabs.json
  def index
    @reimbursement_slabs = ReimbursementSlab.all
  end

  # GET /reimbursement_slabs/1
  # GET /reimbursement_slabs/1.json
  def show
  end

  # GET /reimbursement_slabs/new
  def new
    @reimbursement_slab = ReimbursementSlab.new
    @reimbursement_slabs = ReimbursementSlab.all
  end

  # GET /reimbursement_slabs/1/edit
  def edit
  end

  # POST /reimbursement_slabs
  # POST /reimbursement_slabs.json
  def create
    @reimbursement_slab = ReimbursementSlab.new(reimbursement_slab_params)
    @reimbursement_slabs = ReimbursementSlab.all

    respond_to do |format|
      if @reimbursement_slab.save
    @reimbursement_slab = ReimbursementSlab.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Reimbursement Slab was Successfully created.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /reimbursement_slabs/1
  # PATCH/PUT /reimbursement_slabs/1.json
  def update
    @reimbursement_slab.update(reimbursement_slab_params)
    @reimbursement_slab = ReimbursementSlab.new
    @reimbursement_slabs = ReimbursementSlab.all
  end

  # DELETE /reimbursement_slabs/1
  # DELETE /reimbursement_slabs/1.json
  def destroy
    @reimbursement_slab.destroy
    @reimbursement_slabs = ReimbursementSlab.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement_slab
      @reimbursement_slab = ReimbursementSlab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reimbursement_slab_params
      params.require(:reimbursement_slab).permit(:reimbursement_head_id, :employee_grade_id, :employee_designation_id, :from, :to, :monthly_amount, :yearly_amount, :status)
    end
end
