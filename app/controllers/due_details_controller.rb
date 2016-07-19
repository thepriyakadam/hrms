class DueDetailsController < ApplicationController
  before_action :set_due_detail, only: [:show, :edit, :update, :destroy]

  # GET /due_details
  # GET /due_details.json
  def index
    @due_details = DueDetail.all
  end

  # GET /due_details/1
  # GET /due_details/1.json
  def show
  end

  # GET /due_details/new
  def new
    @due_detail = DueDetail.new
    @due_details = DueDetail.all
  end

  # GET /due_details/1/edit
  def edit
  end

  # POST /due_details
  # POST /due_details.json

  def create
     @due_detail = DueDetail.new(due_detail_params)
     @due_details = DueDetail.all
      if @due_detail.save
        @due_detail = DueDetail.new
      end
      redirect_to new_due_detail_path
      flash[:notice] = 'Due Detail created Successfully.'   
  end

  # PATCH/PUT /due_details/1
  # PATCH/PUT /due_details/1.json

  def update
    @due_detail.update(due_detail_params)
    @due_details = DueDetail.all
    @due_detail = DueDetail.new
    redirect_to new_due_detail_path
    flash[:notice] = 'Due Detail updated Successfully.'   
  end

  # DELETE /due_details/1
  # DELETE /due_details/1.json

  def destroy
    @due_detail.destroy
    @due_details = DueDetail.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_detail
      @due_detail = DueDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_detail_params
      params.require(:due_detail).permit(:due_employee_template_id, :reporting_master_id, :status)
    end
end
