class DueActionsController < ApplicationController
  before_action :set_due_action, only: [:show, :edit, :update, :destroy]

  # GET /due_actions
  # GET /due_actions.json
  def index
    @due_actions = DueAction.all
  end

  # GET /due_actions/1
  # GET /due_actions/1.json
  def show
  end

  # GET /due_actions/new
  def new
    # byebug
    @due_action = DueAction.new
    # @due_detail = DueDetail.find(params[:due_detail_id])
    @due_employee_detail = DueEmployeeDetail.find(params[:due_employee_detail_id])
    # @due_actions = DueAction.where(due_detail_id: @due_detail.id)
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
  end

  # GET /due_actions/1/edit
  def edit
  end

  # POST /due_actions
  # POST /due_actions.json

  def create
     @due_action = DueAction.new(due_action_params)
     @due_actions = DueAction.all
      if @due_action.save
        # byebug
        @due_action = DueAction.new
        flash[:notice] = 'Due Action created Successfully.'   
      end
      @due_employee_detail_id = DueEmployeeDetail.find(params[:due_action][:due_employee_detail_id])
      redirect_to new_due_action_path(due_employee_detail_id: @due_employee_detail_id.id)
  end

  # PATCH/PUT /due_actions/1
  # PATCH/PUT /due_actions/1.json


  def update
    @due_action.update(due_action_params)
    @due_action = DueAction.new
    @due_employee_detail = DueEmployeeDetail.find(params[:due_employee_detail_id])
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
    flash[:notice] = 'Due Action updated Successfully.'   
  end

  # DELETE /due_actions/1
  # DELETE /due_actions/1.json

  def destroy
    @due_action.destroy
    @due_actions = DueAction.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_action
      @due_action = DueAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_action_params
      params.require(:due_action).permit(:due_detail_id, :name, :remark, :amount, :due_detail_id, :due_employee_detail_id)
    end
end
